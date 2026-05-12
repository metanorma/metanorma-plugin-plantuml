# frozen_string_literal: true

module Metanorma
  module Plugin
    module Plantuml
      class ImageBlockMacroProcessor < ::Asciidoctor::Extensions::BlockMacroProcessor
        include ::Metanorma::Plugin::Plantuml::BlockProcessorBase

        use_dsl
        named :plantuml_image

        def process(parent, target, attrs)
          display_text = target

          if parent.document.attr("plantuml-disabled")
            return abort(parent, display_text, attrs,
                         "PlantUML processing disabled")
          end

          unless Backend.plantuml_available?
            return abort(parent, display_text, attrs, "PlantUML not installed")
          end

          source = read_source_file(parent, target)
          formats = parse_formats(attrs, parent.document)
          options = parse_options(parent, target, attrs)

          process_image_block(parent, source, attrs, formats, options)
        rescue StandardError => e
          abort(parent, display_text, attrs, e.message)
        end

        private

        def read_source_file(parent, target)
          docfile_directory = File.dirname(
            parent.document.attributes["docfile"] || ".",
          )

          resolved_path = parent.document
            .path_resolver
            .system_path(target, docfile_directory)

          File.read(resolved_path, encoding: "UTF-8")
        end

        def add_image_path_to_includedirs(document, image_path, includedirs)
          docdir = document.attributes["docdir"]
          includedirs << File.dirname(
            document.path_resolver.system_path(image_path, docdir),
          )
          includedirs.compact.uniq
        end

        def parse_options(parent, target, attrs) # rubocop:disable Metrics/AbcSize
          options = {}

          options[:includedirs] = parse_doc_includedirs(parent.document)
          options[:includedirs] = add_attrs_to_includedirs(
            parent.document, attrs, options[:includedirs]
          )
          options[:includedirs] = add_image_path_to_includedirs(
            parent.document, target, options[:includedirs]
          )

          if attrs["layout"]
            options[:layout] = attrs["layout"].strip.downcase
          end

          options
        end
      end
    end
  end
end
