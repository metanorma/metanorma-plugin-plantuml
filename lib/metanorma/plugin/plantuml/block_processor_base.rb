# frozen_string_literal: true

require "asciidoctor"
require "asciidoctor/extensions"
require_relative "backend"

module Metanorma
  module Plugin
    module Plantuml
      module BlockProcessorBase
        def abort(parent, reader, attrs, msg)
          warn msg
          attrs["language"] = "plantuml"
          create_listing_block(
            parent,
            reader.respond_to?(:source) ? reader.source : reader,
            attrs.reject { |k, _v| k.to_s.match?(/^\d+$/) },
          )
        end

        private

        def parse_doc_includedirs(document)
          docdir = document.attributes["docdir"]
          includedirs = document.attr("plantuml-includedirs")&.split(";") || []

          includedirs.map! do |includedir|
            if Pathname.new(includedir).relative?
              Pathname.new(docdir).join(includedir).to_s
            else
              includedir
            end
          end

          includedirs.compact.uniq
        end

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

        def add_attrs_to_includedirs(document, attrs, includedirs)
          docdir = document.attributes["docdir"]
          attrs_includedirs = attrs["includedirs"]&.split(";") || []

          attrs_includedirs.each do |attrs_includedir|
            includedirs << if Pathname.new(attrs_includedir).relative?
                             Pathname.new(docdir).join(attrs_includedir).to_s
                           else
                             attrs_includedir
                           end
          end

          includedirs.compact.uniq
        end

        def process_image_block(parent, reader, attrs, formats, options) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
          if formats.length == 1
            # Single format - original behavior
            filename = Backend.generate_file(
              parent, reader, format_override: formats.first, options: options
            )
            through_attrs = Backend.generate_attrs(attrs)
            through_attrs["target"] = filename
          else
            # Multiple formats - generate multiple files
            through_attrs = Backend
              .generate_multiple_files(
                parent, reader, formats, attrs, options: options
              )
          end

          create_image_block parent, through_attrs
        end
      end
    end
  end
end
