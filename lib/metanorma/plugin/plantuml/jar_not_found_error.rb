# frozen_string_literal: true

require_relative "plantuml_error"

module Metanorma
  module Plugin
    module Plantuml
      class JarNotFoundError < PlantumlError
        def initialize(jar_path = nil)
          message = if jar_path
                      "PlantUML JAR file not found at: #{jar_path}"
                    else
                      "PlantUML JAR file not found"
                    end
          super(message)
        end
      end
    end
  end
end
