# frozen_string_literal: true

module Ieee
  module Idams
    # Publication ID acronym
    class PublicationAcronym < Lutaml::Model::Serializable
      # Type of acronym
      # @return [String]
      attribute :type, :string

      # Acronym value
      # @return [String]
      attribute :value, :string

      xml do
        root "acronym"
        map_attribute "acronymtype", to: :type
        map_content to: :value
      end
    end
  end
end
