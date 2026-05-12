# frozen_string_literal: true

require "open3"
require "tempfile"
require "fileutils"
require "tmpdir"

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
          def generate( # rubocop:disable Metrics/MethodLength
            content,
            format: DEFAULT_FORMAT,
            output_file: nil, **options
          )
            validate_format!(format)
            ensure_jar_available!
            ensure_java_available!

            content = content.dup.force_encoding("UTF-8")
            include_files = get_include_files(content, options)
            options[:include_files] = include_files unless include_files.empty?

            result = if output_file
                       generate_to_file(content, format, output_file, options)
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

          def version
            return nil unless available?

            cmd = [configuration.java_path, *configuration.jvm_options, "-jar",
                   PLANTUML_JAR_PATH, "-version"]
            output, _, status = Open3.capture3(*cmd)

            if status.success?
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
            FileUtils.mkdir_p(output_dir)

            execute_plantuml(content, format, output_file, options)

            unless File.exist?(output_file)
              raise GenerationError,
                    "Output file was not created: #{output_file}"
            end

            { output_path: File.expand_path(output_file) }
          end

          def generate_to_temp_file(content, format, options)
            temp_dir = configuration.temp_dir || Dir.tmpdir
            timestamp = Utils.generate_timestamp
            output_file = File.join(temp_dir, "plantuml_#{timestamp}.#{format}")

            generate_to_file(content, format, output_file, options)
          end

          def execute_plantuml(content, format, output_file, options) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize, Metrics/MethodLength
            Dir.mktmpdir do |temp_dir| # rubocop:disable Metrics/BlockLength
              File.write("#{temp_dir}/plantuml_input.puml", content)

              if options[:include_files] && !options[:include_files].empty?
                if options[:includedirs].empty?
                  raise PlantumlError,
                        "includedirs is required when include files are specified"
                end

                options[:include_files].each do |include_file|
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

                  temp_include_file = Pathname.new(temp_dir)
                    .join(include_file).to_s

                  FileUtils.mkdir_p(File.dirname(temp_include_file))

                  File.open(temp_include_file, "w:UTF-8") do |f| # rubocop:disable Style/FileWrite
                    f.write(File.read(found_include_file, encoding: "UTF-8"))
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

              if output_file
                generated_file = find_generated_file(temp_dir, content,
                                                     format)
                if generated_file && File.exist?(generated_file)
                  FileUtils.mv(generated_file, output_file)
                else
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
            extension = format.to_s.downcase

            plantuml_filename = FilenameResolver.extract(content)

            if plantuml_filename
              generated_file = File.join(temp_dir,
                                         "#{plantuml_filename}.#{extension}")
              return generated_file if File.exist?(generated_file)
            end

            Dir.glob(File.join(temp_dir, "*.#{extension}")).first
          end

          def build_command(input_file, format, output_dir, options) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
            cmd = [
              configuration.java_path,
              *configuration.jvm_options,
              "-jar", PLANTUML_JAR_PATH
            ]

            format_str = format.to_s.downcase
            cmd << "-t#{format_str}" if SUPPORTED_FORMATS.include?(format_str)

            layout = options[:layout] || "smetana"
            cmd << "-Playout=#{layout}"

            cmd << "-o" << output_dir
            cmd << "-charset" << "UTF-8"
            cmd << input_file

            cmd
          end
        end
      end
    end
  end
end
