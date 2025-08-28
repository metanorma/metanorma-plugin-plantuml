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

          def relative_file_path(document, file_path)
            return file_path if Pathname.new(file_path).absolute?

            docdir = document.attributes["docdir"] || Dir.pwd
            File.expand_path(file_path, docdir)
          end
        end
      end
    end
  end
end
