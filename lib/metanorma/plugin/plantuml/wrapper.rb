# frozen_string_literal: true

require "open3"
require "base64"
require "tempfile"
require "fileutils"
require "tmpdir"
require "rbconfig"
require_relative "version"
require_relative "errors"
require_relative "config"

module Metanorma
  module Plugin
    module Plantuml
      class Wrapper
        PLANTUML_JAR_NAME = "plantuml.jar"
        PLANTUML_JAR_PATH = File.join(
          Gem::Specification.find_by_name("metanorma-plugin-plantuml").gem_dir,
          "data", PLANTUML_JAR_NAME
        )

        SUPPORTED_FORMATS = %w[png svg pdf txt eps].freeze
        DEFAULT_FORMAT = "png"

        class << self
          def jvm_options
            options = ["-Xss5m", "-Xmx1024m"]

            options << "-Dapple.awt.UIElement=true" if RbConfig::CONFIG["host_os"].match?(/darwin|mac os/)

            options
          end

          def generate( # rubocop:disable Metrics/MethodLength
            content,
            format: DEFAULT_FORMAT,
            output_file: nil,
            base64: false, **options
          )
            validate_format!(format)
            ensure_jar_available!
            ensure_java_available!

            include_files = get_include_files(content, options)
            options[:include_files] = include_files unless include_files.empty?

            result = if output_file
                       generate_to_file(content, format, output_file, options)
                     elsif base64
                       generate_to_base64(content, format, options)
                     else
                       generate_to_temp_file(content, format, options)
                     end

            { success: true }.merge(result)
          rescue PlantumlError => e
            { success: false, error: e }
          end

          def get_include_files(content, _options)
            include_files = []
            content.each_line do |line|
              case line
              when /(!include|!includesub)\s(.+){1}/
                found_file = ::Regexp.last_match(2).split("!").first

                # skip web links and standard libraries
                found_file = nil if found_file.start_with?("<", "http")

                include_files << found_file
              end
            end
            include_files.compact.uniq
          end

          def generate_from_file(
            input_file, format: DEFAULT_FORMAT,
            output_file: nil, base64: false, **options
          )
            unless File.exist?(input_file)
              raise GenerationError,
                    "Input file not found: #{input_file}"
            end

            content = File.read(input_file)
            generate(content, format: format, output_file: output_file,
                              base64: base64, **options)
          end

          def version
            return nil unless available?

            cmd = [configuration.java_path, *jvm_options, "-jar",
                   PLANTUML_JAR_PATH, "-version"]
            output, _, status = Open3.capture3(*cmd)

            if status.success?
              # Extract version from output
              version_match = output.match(/PlantUML version ([\d.]+)/)
              version_match ? version_match[1] : PLANTUML_JAR_VERSION
            end
          rescue StandardError
            nil
          end

          def available?
            return false if ENV["PLANTUML_DISABLED"] == "true"

            File.exist?(PLANTUML_JAR_PATH) && java_available?
          end

          def jar_path
            PLANTUML_JAR_PATH
          end

          private

          def configuration
            Plantuml.configuration
          end

          def validate_format!(format)
            format_str = format.to_s.downcase
            return if SUPPORTED_FORMATS.include?(format_str)

            raise InvalidFormatError.new(format, SUPPORTED_FORMATS)
          end

          def ensure_jar_available!
            return if File.exist?(PLANTUML_JAR_PATH)

            raise JarNotFoundError, PLANTUML_JAR_PATH
          end

          def ensure_java_available!
            return if java_available?

            raise JavaNotFoundError
          end

          def java_available?
            cmd = [configuration.java_path, "-version"]
            _, _, status = Open3.capture3(*cmd)
            status.success?
          rescue StandardError
            false
          end

          def generate_to_file(content, format, output_file, options)
            output_dir = File.dirname(output_file)
            FileUtils.mkdir_p(output_dir) unless Dir.exist?(output_dir)

            execute_plantuml(content, format, output_file, options)

            unless File.exist?(output_file)
              raise GenerationError,
                    "Output file was not created: #{output_file}"
            end

            { output_path: File.expand_path(output_file) }
          end

          def generate_to_base64(content, format, options)
            Tempfile.create(["plantuml_output", ".#{format}"]) do |temp_file|
              temp_file.close

              execute_plantuml(content, format, temp_file.path, options)

              unless File.exist?(temp_file.path)
                raise GenerationError,
                      "Temporary output file was not created"
              end

              encoded_content = Base64
                .strict_encode64(File.read(temp_file.path))
              { base64: encoded_content }
            end
          end

          def generate_to_temp_file(content, format, options)
            temp_dir = configuration.temp_dir || Dir.tmpdir
            timestamp = Time.now.strftime("%Y%m%d_%H%M%S_%L")
            output_file = File.join(temp_dir, "plantuml_#{timestamp}.#{format}")

            generate_to_file(content, format, output_file, options)
          end

          def execute_plantuml(content, format, output_file, options) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize, Metrics/MethodLength
            # PlantUML generates output files based on filename specified in
            # @start... line
            # We need to use a temp directory and then move the file
            Dir.mktmpdir do |temp_dir| # rubocop:disable Metrics/BlockLength
              # create input file
              File.open("#{temp_dir}/plantuml_input.puml", "w") do |f|
                f.write(content)
              end

              # Handle include files
              if options[:include_files] && !options[:include_files].empty?
                if options[:includedirs].empty?
                  # raise error when include files are found but includedirs
                  # is nil
                  raise PlantumlError,
                        "includedirs is required when include files are specified"
                end

                options[:include_files].each do |include_file|
                  # find local include file in includedirs
                  found_include_file = nil
                  options[:includedirs].each do |includedir|
                    include_file_path = Pathname.new(includedir)
                      .join(include_file).to_s

                    if File.exist?(include_file_path)
                      found_include_file = include_file_path
                      break
                    end
                  end

                  next unless found_include_file

                  # create include file in temp directory
                  temp_include_file = Pathname.new(temp_dir)
                    .join(include_file).to_s

                  FileUtils.mkdir_p(File.dirname(temp_include_file))

                  File.open(temp_include_file, "w") do |f|
                    f.write(File.read(found_include_file))
                  end
                end
              end

              cmd = build_command(
                "#{temp_dir}/plantuml_input.puml",
                format,
                temp_dir,
                options,
              )

              output, error, status = Open3.capture3(*cmd)

              unless status.success?
                error_message = if error.empty?
                                  "Unknown PlantUML error"
                                else
                                  error.strip
                                end
                raise GenerationError.new(error_message, error)
              end

              # Find the generated file and move it to the desired location
              if output_file
                generated_file = find_generated_file(temp_dir, content,
                                                     format)
                if generated_file && File.exist?(generated_file)
                  FileUtils.mv(generated_file, output_file)
                else
                  # Debug: List what files were actually generated
                  generated_files = Dir.glob(File.join(temp_dir, "*"))
                  error_msg = "Generated file not found in temp directory. "
                  error_msg += "Expected: #{generated_file}. "
                  error_msg += "Found files: #{generated_files.map do |f|
                    File.basename(f)
                  end.join(', ')}"
                  raise GenerationError, error_msg
                end
              end

              output
            end
          end

          def find_generated_file(temp_dir, content, format)
            # PlantUML generates files based on the filename specified in
            # @start... line
            extension = format.to_s.downcase

            # First, try to extract filename from PlantUML content
            plantuml_filename = extract_plantuml_filename_from_content(content)

            if plantuml_filename
              # Look for file with PlantUML-specified name
              generated_file = File.join(temp_dir,
                                         "#{plantuml_filename}.#{extension}")
              return generated_file if File.exist?(generated_file)
            end

            # Fallback: scan directory for any generated files with
            # the correct extension
            Dir.glob(File.join(temp_dir, "*.#{extension}")).first
          end

          def extract_plantuml_filename_from_content(content)
            # Extract the raw filename from @start... line (don't sanitize)
            match = content.match(/^@start\w+\s+(.{1,999})$/mi)
            return nil unless match

            filename = match[1].strip.split("\n").first&.strip
            return nil if filename.nil? || filename.empty?

            # Remove quotes but keep the original name as PlantUML will use it
            filename.gsub(/^["']|["']$/, "")
          end

          def build_command(input_file, format, output_dir, _options) # rubocop:disable Metrics/MethodLength
            cmd = [
              configuration.java_path,
              *jvm_options,
              "-jar", PLANTUML_JAR_PATH
            ]

            # Add format-specific options
            format_str = format.to_s.downcase
            cmd << "-t#{format_str}" if SUPPORTED_FORMATS.include?(format_str)

            # Use 'smetana' layout engine for pragma
            cmd << "-Playout=smetana"

            # Add output directory option
            cmd << "-o" << output_dir

            # Add charset option for better compatibility
            cmd << "-charset" << "UTF-8"

            # Add input file
            cmd << input_file

            cmd
          end
        end
      end
    end
  end
end
