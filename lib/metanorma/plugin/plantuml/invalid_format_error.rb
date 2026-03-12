# frozen_string_literal: true

require_relative "plantuml_error"

module Metanorma
  module Plugin
    module Plantuml
      class InvalidFormatError < PlantumlError
        def initialize(format, available_formats)
          super(
            "Invalid format '#{format}'. Available formats: " \
            "#{available_formats.join(', ')}",
          )
        end
      end
    end
  end
end
