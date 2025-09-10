# frozen_string_literal: true

module Ieee
  module Idams
    # Represents
    class StandardRelationship < Lutaml::Model::Serializable
      # Product number
      # @return [String] product number code
      # @example "123456"
      attribute :prodnum, :string

      # Relationship date
      # @return [String] relationship date
      # @example "12/31/1969 7:00:00 PM"
      attribute :relationship_date, :string

      # Standard relationship type
      # @return [String] standard relationship type
      # @example "F"
      attribute :type, :string

      # Date string
      # @return [String] date string
      # @example "9-12-1997"
      attribute :date_string, :string

      xml do
        root "standard_relationship"
        map_attribute "prodnum", to: :prodnum, value_map: { to: { empty: :empty } }
        map_attribute "relationship_date", to: :relationship_date, value_map: { to: { empty: :empty } }
        map_attribute "type", to: :type, value_map: { to: { empty: :empty } }
        map_content to: :date_string
      end
    end
  end
end
