# frozen_string_literal: true

module Metanorma
  module Plugin
    module Plantuml
      class FilenameResolver
        class << self
          def extract(content)
            first_line = content.lines.first&.strip
            return nil unless first_line

            match = first_line.match(/^@start\w+\s+(.+)$/i)
            return nil unless match

            filename = match[1].strip
            return nil if filename.empty?

            filename.gsub(/^["']|["']$/, "")
          end

          def sanitize(filename)
            filename
              .gsub(/[^\w\-.]/, "_")
              .gsub(/\.{2,}/, "_")
              .gsub(/_{2,}/, "_")
              .gsub(/^[_\-.]+|[_\-.]+$/, "")
          end
        end
      end
    end
  end
end
