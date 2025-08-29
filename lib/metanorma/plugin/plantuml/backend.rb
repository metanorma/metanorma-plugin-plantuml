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

          def generate_file(parent, reader, format_override = nil) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
            ldir, imagesdir, fmt = generate_file_prep(parent)
            fmt = format_override if format_override
            plantuml_content = prep_source(reader)

            # Extract filename from PlantUML source if specified
            filename = generate_unique_filename(fmt)
            extracted_filename = extract_plantuml_filename(plantuml_content)

            if extracted_filename
              filename = "#{extracted_filename}.#{fmt}"
            end

            absolute_path, relative_path = path_prep(ldir, imagesdir)
            output_file = File.join(absolute_path, filename)

            result = Wrapper.generate(
              plantuml_content,
              format: fmt,
              output_file: output_file,
            )

            unless result[:success]
              raise "No image output from PlantUML: #{result[:error].message}"
            end

            File.join(relative_path, filename)
          end

          def generate_multiple_files(parent, reader, formats, attrs)
            # Generate files for each format
            filenames = formats.map do |format|
              generate_file(parent, reader, format)
            end

            # Return data for BlockProcessor to create image block
            through_attrs = generate_attrs attrs
            through_attrs["target"] = filenames.first

            # Store additional formats for potential future use
            through_attrs["data-formats"] = formats.join(",")
            through_attrs["data-files"] = filenames.join(",")

            through_attrs
          end

          def generate_file_prep(parent)
            ldir = localdir(parent)
            imagesdir = parent.document.attr("imagesdir")
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

          def path_prep(localdir, imagesdir)
            path = Pathname.new(File.join(localdir, "_plantuml_images"))
            sourcepath = imagesdir ? File.join(localdir, imagesdir) : localdir
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

          def prep_source(reader)
            src = reader.source

            # Validate that we have matching start/end pairs
            validate_plantuml_delimiters(src)
            src
          end

          def generate_attrs(attrs)
            %w(id align float title role width height alt)
              .inject({}) do |memo, key|
              memo[key] = attrs[key] if attrs.has_key?(key)
              memo
            end
          end

          private

          def validate_plantuml_delimiters(src) # rubocop:disable Metrics/MethodLength
            # Find @start... pattern
            # (case insensitive, support all PlantUML diagram types)
            start_match = src.match(/^@start(\w+)/i)
            unless start_match
              raise "PlantUML content must start with @start... directive!"
            end

            diagram_type = start_match[1].downcase
            end_pattern = "@end#{diagram_type}"

            # Look for matching @end... directive (case insensitive)
            unless /#{Regexp.escape(end_pattern)}\s*$/mi.match?(src)
              raise "@start#{diagram_type} without matching #{end_pattern} " \
                    "in PlantUML!"
            end
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
