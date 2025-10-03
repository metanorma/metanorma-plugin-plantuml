# frozen_string_literal: true

module Metanorma
  module Plugin
    module Plantuml
      # PlantUML block processor
      class BlockProcessor < ::Asciidoctor::Extensions::BlockProcessor
        include ::Metanorma::Plugin::Plantuml::BlockProcessorBase
        use_dsl
        named :plantuml
        on_context :literal
        parse_content_as :raw

        def process(parent, reader, attrs)
          # Check for document-level disable flag
          if parent.document.attr("plantuml-disabled")
            return abort(parent, reader, attrs,
                         "PlantUML processing disabled")
          end

          # Check PlantUML availability explicitly
          unless Backend.plantuml_available?
            return abort(parent, reader, attrs,
                         "PlantUML not installed")
          end

          # Parse format specifications
          formats = parse_formats(attrs, parent.document)
          options = parse_options(parent, reader, attrs)

          process_image_block(parent, reader, attrs, formats, options)
        rescue StandardError => e
          abort(parent, reader, attrs, e.message)
        end

        private

        def parse_options(parent, _reader, attrs)
          options = {}

          # Parse include directory
          options[:includedirs] = add_attrs_to_includedirs(
            parent.document, attrs, parse_doc_includedirs(parent.document)
          )

          options
        end
      end
    end
  end
end
