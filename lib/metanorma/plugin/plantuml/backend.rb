# frozen_string_literal: true

require "pathname"
require "fileutils"
require_relative "wrapper"
require_relative "utils"
require_relative "errors"

module Metanorma
  module Plugin
    module Plantuml
      # Backend class for PlantUML diagram generation
      # Adapted from metanorma-standoc's PlantUMLBlockMacroBackend
      class Backend
        class << self
          def plantuml_installed?
            return true if plantuml_available?

            raise "PlantUML not installed"
          end

          def plantuml_available?
            Wrapper.available?
          end

          def generate_file( # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
            parent, reader, format_override: nil, options: {}
          )
            ldir, imagesdir, fmt = generate_file_prep(parent)
            fmt = format_override if format_override
            plantuml_content = prep_source(parent, reader)

            # Extract filename from PlantUML source if specified
            filename = generate_unique_filename(fmt)
            extracted_filename = extract_plantuml_filename(plantuml_content)

            filename = "#{extracted_filename}.#{fmt}" if extracted_filename

            absolute_path, relative_path = path_prep(ldir, imagesdir)
            output_file = File.join(absolute_path, filename)

            result = Wrapper.generate(
              plantuml_content,
              format: fmt,
              output_file: output_file,
              includedirs: options[:includedirs],
            )

            raise "No image output from PlantUML: #{result[:error].message}" unless result[:success]

            File.join(relative_path, filename)
          end

          def generate_multiple_files(
            parent, reader, formats, attrs, options: {}
          )
            # Generate files for each format
            filenames = formats.map do |format|
              generate_file(parent, reader, format, options: options)
            end

            # Return data for BlockProcessor to create image block
            through_attrs = generate_attrs attrs
            through_attrs["target"] = filenames.first

            # Store additional formats for potential future use
            through_attrs["data-formats"] = formats.join(",")
            through_attrs["data-files"] = filenames.join(",")

            through_attrs
          end

          def generate_file_prep(parent) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
            imagesdir = if parent.document.attr("docfile") &&
                parent.document.attr("imagesdir")
                          File.expand_path(
                            File.join(
                              File.dirname(parent.document.attr("docfile")),
                              parent.document.attr("imagesdir"),
                            ),
                          )
                        else
                          parent.document.attr("imagesdir")
                        end

            ldir = localdir(parent)
            fmt = parent.document
              .attr("plantuml-image-format")&.strip&.downcase ||
              Wrapper::DEFAULT_FORMAT
            [ldir, imagesdir, fmt]
          end

          def localdir(parent)
            ret = Utils.localdir(parent.document)
            return ret if File.writable?(ret)

            raise "Destination directory #{ret} not writable for PlantUML!"
          end

          def path_prep(localdir, imagesdir) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
            # Determine source path
            sourcepath = if imagesdir.nil?
                           localdir
                         elsif Pathname.new(imagesdir).absolute?
                           imagesdir
                         else
                           File.join(localdir, imagesdir)
                         end

            # Determine PlantUML images destination absolute path
            path = Pathname.new(
              File.expand_path(File.join(localdir, "_plantuml_images")),
            )
            path.mkpath

            unless File.writable?(path)
              raise "Destination path #{path} not writable for PlantUML!"
            end

            [
              path,
              Pathname.new(path)
                .relative_path_from(Pathname.new(sourcepath)).to_s,
            ]
          end

          def prep_source(parent, reader) # rubocop:disable Metrics/MethodLength
            src = if reader.respond_to?(:source)
                    # get content from BlockProcessor
                    reader.source
                  else
                    # get content from ImageBlockMacroProcessor
                    docfile_directory = File.dirname(
                      parent.document.attributes["docfile"] || ".",
                    )

                    resolved_path = parent.document
                      .path_resolver
                      .system_path(reader, docfile_directory)

                    File.read(resolved_path)
                  end

            # Validate that we have matching start/end pairs
            validate_plantuml_delimiters(src)
            src
          end

          def generate_attrs(attrs)
            %w[id align float title role width height alt]
              .each_with_object({}) do |key, memo|
              memo[key] = attrs[key] if attrs.key?(key)
            end
          end

          private

          def validate_plantuml_delimiters(src)
            # Find @start... pattern
            # (case insensitive, support all PlantUML diagram types)
            start_match = src.match(/^@start(\w+)/i)
            raise "PlantUML content must start with @start... directive!" unless start_match

            diagram_type = start_match[1].downcase
            end_pattern = "@end#{diagram_type}"

            # Look for matching @end... directive (case insensitive)
            return if /#{Regexp.escape(end_pattern)}\s*$/mi.match?(src)

            raise "@start#{diagram_type} without matching #{end_pattern} " \
                  "in PlantUML!"
          end

          def extract_plantuml_filename(plantuml_content)
            # Extract filename from any @start... line if specified
            # Only match when filename is on the same line as @start...
            # (no newlines)
            lines = plantuml_content.lines
            first_line = lines.first&.strip
            return nil unless first_line

            match = first_line.match(/^@start\w+\s+(.+)$/i)
            return nil unless match

            filename = match[1].strip
            return nil if filename.nil? || filename.empty?

            # Sanitize filename for filesystem use
            sanitize_filename(filename)
          end

          def sanitize_filename(filename)
            # Remove quotes and sanitize for filesystem
            filename = filename.gsub(/^["']|["']$/, "")
            # Replace any non-alphanumeric characters
            # (except dash, underscore, dot) with underscore
            filename.gsub(/[^\w\-.]/, "_")
              .gsub(/\.{2,}/, "_")  # Replace multiple dots with underscore
              .gsub(/_{2,}/, "_")   # Replace multiple underscores with single
              .gsub(/^[_\-.]+|[_\-.]+$/, "") # Remove leading/trailing chars
          end

          def generate_unique_filename(format)
            timestamp = Time.now.strftime("%Y%m%d_%H%M%S_%L")
            "plantuml_#{timestamp}.#{format}"
          end
        end
      end
    end
  end
end
