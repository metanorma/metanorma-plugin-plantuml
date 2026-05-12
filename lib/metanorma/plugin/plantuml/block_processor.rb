# frozen_string_literal: true

module Metanorma
  module Plugin
    module Plantuml
      class BlockProcessor < ::Asciidoctor::Extensions::BlockProcessor
        include ::Metanorma::Plugin::Plantuml::BlockProcessorBase

        use_dsl
        named :plantuml
        on_context :literal
        parse_content_as :raw

        def process(parent, reader, attrs)
          source = reader.source

          if parent.document.attr("plantuml-disabled")
            return abort(parent, source, attrs,
                         "PlantUML processing disabled")
          end

          unless Backend.plantuml_available?
            return abort(parent, source, attrs, "PlantUML not installed")
          end

          formats = parse_formats(attrs, parent.document)
          options = parse_options(parent, reader, attrs)

          process_image_block(parent, source, attrs, formats, options)
        rescue StandardError => e
          abort(parent, source, attrs, e.message)
        end

        private

        def parse_options(parent, _reader, attrs)
          options = {}

          options[:includedirs] = add_attrs_to_includedirs(
            parent.document, attrs, parse_doc_includedirs(parent.document)
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
