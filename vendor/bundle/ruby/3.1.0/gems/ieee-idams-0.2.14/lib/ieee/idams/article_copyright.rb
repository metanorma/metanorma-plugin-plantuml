# frozen_string_literal: true

module Ieee
  module Idams
    # Article copyright information
    class ArticleCopyright < Lutaml::Model::Serializable
      # <articlecopyright holderisieee="Yes" year="0"/>

      attribute :holder_is_ieee, :string
      attribute :year, :integer

      xml do
        root "articlecopyright"

        map_attribute "holderisieee", to: :holder_is_ieee
        map_attribute "year", to: :year
      end
    end
  end
end
