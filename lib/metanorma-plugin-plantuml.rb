# frozen_string_literal: true

module Metanorma
  module Plugin
    module Plantuml
      class << self
        attr_writer :configuration
      end

      def self.configuration
        @configuration ||= Config.new
      end

      def self.configure
        yield(configuration)
      end

      autoload :PlantumlError,
               "metanorma/plugin/plantuml/plantuml_error"
      autoload :JarNotFoundError,
               "metanorma/plugin/plantuml/jar_not_found_error"
      autoload :JavaNotFoundError,
               "metanorma/plugin/plantuml/java_not_found_error"
      autoload :GenerationError,
               "metanorma/plugin/plantuml/generation_error"
      autoload :InvalidFormatError,
               "metanorma/plugin/plantuml/invalid_format_error"
      autoload :Config, "metanorma/plugin/plantuml/config"
      autoload :Utils, "metanorma/plugin/plantuml/utils"
      autoload :Wrapper, "metanorma/plugin/plantuml/wrapper"
      autoload :Backend, "metanorma/plugin/plantuml/backend"
      autoload :BlockProcessorBase,
               "metanorma/plugin/plantuml/block_processor_base"
      autoload :BlockProcessor,
               "metanorma/plugin/plantuml/block_processor"
      autoload :ImageBlockMacroProcessor,
               "metanorma/plugin/plantuml/image_block_macro_processor"
    end
  end
end

require "metanorma/plugin/plantuml/version"
