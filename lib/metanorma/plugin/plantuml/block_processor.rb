# frozen_string_literal: true

require "asciidoctor"
require "asciidoctor/extensions"
require_relative "backend"

module Metanorma
  module Plugin
    module Plantuml
      # PlantUML block processor for Asciidoctor
      class BlockProcessor < ::Asciidoctor::Extensions::BlockProcessor
        use_dsl
        named :plantuml
        on_context :literal
        parse_content_as :raw

        def abort(parent, reader, attrs, msg)
          warn msg
          attrs["language"] = "plantuml"
          create_listing_block(
            parent,
            reader.source,
            attrs.reject { |k, _v| k.to_s.match?(/^\d+$/) },
          )
        end

        def process(parent, reader, attrs) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
          # Check for document-level disable flag
          if parent.document.attr("plantuml-disabled")
            return abort(parent, reader, attrs, "PlantUML processing disabled")
          end

          # Check PlantUML availability explicitly
          unless Backend.plantuml_available?
            return abort(parent, reader, attrs, "PlantUML not installed")
          end

          # Parse format specifications
          formats = parse_formats(attrs, parent.document)

          if formats.length == 1
            # Single format - original behavior
            filename = Backend.generate_file(parent, reader, formats.first)
            through_attrs = Backend.generate_attrs(attrs)
            through_attrs["target"] = filename
          else
            # Multiple formats - generate multiple files
            through_attrs = Backend
              .generate_multiple_files(parent, reader, formats, attrs)
          end
          create_image_block parent, through_attrs
        rescue StandardError => e
          abort(parent, reader, attrs, e.message)
        end

        private

        def parse_formats(attrs, document) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize, Metrics/MethodLength
          # Check for formats attribute (multiple formats)
          if attrs["formats"]
            formats = attrs["formats"].split(",").map(&:strip).map(&:downcase)
            return formats.select { |f| valid_format?(f) }
          end

          # Check for format attribute (single format override)
          if attrs["format"]
            format = attrs["format"].strip.downcase
            return [format] if valid_format?(format)
          end

          # Fall back to document attribute or default
          default_format = document
            .attr("plantuml-image-format")&.strip&.downcase ||
            Wrapper::DEFAULT_FORMAT

          [default_format]
        end

        def valid_format?(format)
          Wrapper::SUPPORTED_FORMATS.include?(format)
        end
      end
    end
  end
end
