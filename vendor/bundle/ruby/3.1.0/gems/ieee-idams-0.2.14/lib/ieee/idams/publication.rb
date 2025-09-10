# frozen_string_literal: true

require_relative "publication_info"
require_relative "volume"
require_relative "pub_model"

module Ieee
  module Idams
    # Represents an IEEE IDAMS publication record
    class Publication < Lutaml::Model::Serializable
      model PubModel

      # Publication title
      # @return [String] normalized title
      attribute :title, :string

      # Publication normalized title
      # @return [String] normalized title
      attribute :normtitle, :string

      # Standards family title
      # @return [String] family title for standards
      attribute :standardsfamilytitle, :string

      # Publication information
      # @return [PublicationInfo] detailed publication metadata
      attribute :publicationinfo, PublicationInfo

      # Volume information
      # @return [Volume] volume details
      attribute :volume, Volume

      xml do
        root "publication"
        map_element "title", to: :title, cdata: true
        map_element "normtitle", to: :normtitle, cdata: true
        map_element "standardsfamilytitle", to: :standardsfamilytitle
        map_element "publicationinfo", to: :publicationinfo
        map_element "volume", to: :volume
      end
    end
  end
end
