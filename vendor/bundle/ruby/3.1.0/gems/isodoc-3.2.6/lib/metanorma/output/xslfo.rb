require "mn2pdf"
require_relative "./utils"

module Metanorma
  module Output
    class XslfoPdf < Base
      def convert(url_path, output_path, xsl_stylesheet, options = {})
        return if url_path.nil? || output_path.nil? || xsl_stylesheet.nil?

        Mn2pdf.convert(url_path, output_path, xsl_stylesheet, options)
      end
    end
  end
end
