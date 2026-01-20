# frozen_string_literal: true

require "liquid"
require "pathname"

module Metanorma
  module Plugin
    module Plantuml
      module Utils
        class << self
          def localdir(document)
            if document.attributes["docfile"]
              File.dirname(document.attributes["docfile"])
            else
              document.attributes["docdir"] ||
                document.attributes["localdir"] ||
                File.dirname(".")
            end
          end
        end
      end
    end
  end
end
