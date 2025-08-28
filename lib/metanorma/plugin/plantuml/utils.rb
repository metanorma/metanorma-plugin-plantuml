# frozen_string_literal: true

require "liquid"
require "pathname"

module Metanorma
  module Plugin
    module Plantuml
      module Utils
        class << self
          def localdir(document)
            document.attributes["localdir"] ||
              document.attributes["docdir"] ||
              File.dirname(document.attributes["docfile"] || ".")
          end
        end
      end
    end
  end
end
