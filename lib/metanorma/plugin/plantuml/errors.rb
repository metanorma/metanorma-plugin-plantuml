module Metanorma
  module Plugin
    module Plantuml
      class PlantumlError < StandardError
        def initialize(message = nil, original_error = nil)
          super(message)
          @original_error = original_error
        end

        attr_reader :original_error
      end

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

      class JavaNotFoundError < PlantumlError
        def initialize
          super(
            "Java runtime not found. Please ensure Java is installed and " \
            "available in PATH",
          )
        end
      end

      class GenerationError < PlantumlError
        def initialize(message, java_error = nil)
          super("PlantUML generation failed: #{message}")
          @original_error = java_error
        end
      end

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
