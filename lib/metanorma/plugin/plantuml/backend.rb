# frozen_string_literal: true

require "pathname"
require "fileutils"

module Metanorma
  module Plugin
    module Plantuml
      class Backend
        class << self
          def plantuml_installed?
            return true if plantuml_available?

            raise PlantumlError, "PlantUML not installed"
          end

          def plantuml_available?
            Wrapper.available?
          end

          def generate_file( # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
            parent, source, format_override: nil, options: {}
          )
            ldir, imagesdir, fmt = generate_file_prep(parent)
            fmt = format_override if format_override
            validate_source(source)

            filename = generate_unique_filename(fmt)
            extracted_filename = FilenameResolver.extract(source)

            if extracted_filename
              safe_filename = FilenameResolver.sanitize(extracted_filename)
              filename = "#{safe_filename}.#{fmt}"
            end

            absolute_path, relative_path = path_prep(ldir, imagesdir)
            output_file = File.join(absolute_path, filename)

            result = Wrapper.generate(
              source,
              format: fmt,
              output_file: output_file,
              includedirs: options[:includedirs],
              layout: options[:layout],
            )

            unless result[:success]
              raise GenerationError,
                    "No image output from PlantUML: #{result[:error].message}"
            end

            File.join(relative_path, filename)
          end

          def generate_multiple_files(
            parent, source, formats, attrs, options: {}
          )
            filenames = formats.map do |format|
              generate_file(parent, source,
                            format_override: format, options: options)
            end

            through_attrs = generate_attrs attrs
            through_attrs["target"] = filenames.first
            through_attrs["data-formats"] = formats.join(",")
            through_attrs["data-files"] = filenames.join(",")

            through_attrs
          end

          def validate_source(source)
            diagram_type = extract_diagram_type(source)
            return if diagram_type && matching_end?(source, diagram_type)

            raise GenerationError,
                  "@start#{diagram_type} without matching " \
                  "@end#{diagram_type} in PlantUML!"
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

            raise GenerationError,
                  "Destination directory #{ret} not writable for PlantUML!"
          end

          def path_prep(localdir, imagesdir) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
            sourcepath = if imagesdir.nil?
                           localdir
                         elsif Pathname.new(imagesdir).absolute?
                           imagesdir
                         else
                           File.join(localdir, imagesdir)
                         end

            path = Pathname.new(
              File.expand_path(File.join(localdir, "_plantuml_images")),
            )
            path.mkpath

            unless File.writable?(path)
              raise GenerationError,
                    "Destination path #{path} not writable for PlantUML!"
            end

            [
              path,
              Pathname.new(path)
                .relative_path_from(Pathname.new(sourcepath)).to_s,
            ]
          end

          def generate_attrs(attrs)
            %w[id align float title role width height alt]
              .each_with_object({}) do |key, memo|
              memo[key] = attrs[key] if attrs.key?(key)
            end
          end

          private

          def extract_diagram_type(source)
            match = source.match(/^@start(\w+)/i)
            unless match
              raise GenerationError,
                    "PlantUML content must start with @start... directive!"
            end

            match[1].downcase
          end

          def matching_end?(source, diagram_type)
            end_pattern = "@end#{diagram_type}"
            /#{Regexp.escape(end_pattern)}\s*$/mi.match?(source)
          end

          def generate_unique_filename(format)
            timestamp = Utils.generate_timestamp
            "plantuml_#{timestamp}.#{format}"
          end
        end
      end
    end
  end
end
