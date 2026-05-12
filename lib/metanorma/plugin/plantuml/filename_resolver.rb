# frozen_string_literal: true

module Metanorma
  module Plugin
    module Plantuml
      class FilenameResolver
        class << self
          def extract(content)
            first_line = content.lines.first&.strip
            return nil unless first_line

            match = first_line.match(/^@start\w+\s+([^\n]+)/i)
            return nil unless match

            filename = match[1].strip
            return nil if filename.empty?

            filename.gsub(/^["']|["']$/, "")
          end

          def sanitize(filename)
            result = filename.gsub(/[^\w\-.]/, "_")
            result = result.tr_s("._", "._")
            result = result.gsub(/\.{2,}/, ".")
            result = result.gsub(/_{2,}/, "_")
            strip_special_edges(result)
          end

          private

          def strip_special_edges(str)
            result = str
            trim = { "_" => true, "-" => true, "." => true }
            result = result[1..] while result.length > 1 && trim[result[0]]
            result = result[..-2] while result.length > 1 && trim[result[-1]]
            result
          end
        end
      end
    end
  end
end
