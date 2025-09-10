# frozen_string_literal: true

module Ieee
  module Idams
    # Represents an ISBN identifier for a book
    class Isbn < Lutaml::Model::Serializable
      # ISBN number
      # @return [String] 13 or 10 digit ISBN, max 15 chars
      attribute :content, :string

      # File type for this ISBN
      # @return [String] one of: paperback, hardcover, ePub, PDF
      attribute :isbnfiletype, :string, values: %w[paperback hardcover ePub PDF]

      # ISBN type specification
      # @return [String] one of: New-2005, Historical
      attribute :isbntype, :string, values: %w[New-2005 Historical]

      # Media type
      # @return [String] one of: Paper, CD, Online, Electronic
      attribute :mediatype, :string, values: %w[Paper CD Online Electronic]

      xml do
        root "isbn"
        map_content to: :content
        map_attribute "isbnfiletype", to: :isbnfiletype
        map_attribute "isbntype", to: :isbntype
        map_attribute "mediatype", to: :mediatype
      end
    end
  end
end
