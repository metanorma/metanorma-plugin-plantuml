# frozen_string_literal: true

require_relative "plantuml_error"

module Metanorma
  module Plugin
    module Plantuml
      class JavaNotFoundError < PlantumlError
        def initialize
          super(
            "Java runtime not found. Please ensure Java is installed and " \
            "available in PATH",
          )
        end
      end
    end
  end
end
