# frozen_string_literal: true

require_relative "plantuml_error"

module Metanorma
  module Plugin
    module Plantuml
      class GenerationError < PlantumlError
        def initialize(message, java_error = nil)
          super("PlantUML generation failed: #{message}")
          @original_error = java_error
        end
      end
    end
  end
end
