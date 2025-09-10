# frozen_string_literal: true

module Ieee
  module Idams
    # Represents a keyword
    class Keyword < Lutaml::Model::Serializable
      # Keyword term
      # @return [String] keyword text
      attribute :keywordterm, :string
      attribute :keywordmodifier, :string

      xml do
        root "keyword"
        map_element "keywordterm", to: :keywordterm, cdata: true
        map_element "keywordmodifier", to: :keywordmodifier
      end
    end
  end
end
