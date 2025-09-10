# frozen_string_literal: true

require "lutaml/model"

require_relative "area"
require_relative "city_section"
require_relative "hierarchical_part"
require_relative "region"

module LocMods
  class HierarchicalGeographic < Lutaml::Model::Serializable
    attribute :authority, :string
    attribute :authority_uri, :string
    attribute :value_uri, :string
    attribute :extra_terrestrial_area, HierarchicalPart, collection: true
    attribute :continent, HierarchicalPart, collection: true
    attribute :country, HierarchicalPart, collection: true
    attribute :province, :string, collection: true
    attribute :region, Region, collection: true
    attribute :state, HierarchicalPart, collection: true
    attribute :territory, HierarchicalPart, collection: true
    attribute :county, HierarchicalPart, collection: true
    attribute :city, HierarchicalPart, collection: true
    attribute :city_section, CitySection, collection: true
    attribute :island, HierarchicalPart, collection: true
    attribute :area, Area, collection: true

    xml do
      root "hierarchicalGeographic"
      namespace "http://www.loc.gov/mods/v3", nil

      map_attribute "authority", to: :authority
      map_attribute "authorityURI", to: :authority_uri
      map_attribute "valueURI", to: :value_uri
      map_element "extraTerrestrialArea", to: :extra_terrestrial_area
      map_element "continent", to: :continent
      map_element "country", to: :country
      map_element "province", to: :province
      map_element "region", to: :region
      map_element "state", to: :state
      map_element "territory", to: :territory
      map_element "county", to: :county
      map_element "city", to: :city
      map_element "citySection", to: :city_section
      map_element "island", to: :island
      map_element "area", to: :area
    end
  end
end
