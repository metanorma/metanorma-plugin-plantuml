# frozen_string_literal: true

module Ieee
  module Idams
    # Article file name
    class ArticleFilename < Lutaml::Model::Serializable
      # <filename docpartition="4" filetype="MainPDF">00000003.pdf</filename>

      attribute :docpartition, :string
      attribute :filetype, :string
      attribute :filename, :string

      xml do
        root "filename"

        map_attribute "docpartition", to: :docpartition
        map_attribute "filetype", to: :filetype
        map_content to: :filename
      end
    end
  end
end
