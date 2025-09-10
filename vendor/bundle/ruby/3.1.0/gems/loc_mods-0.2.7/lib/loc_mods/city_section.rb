# frozen_string_literal: true

require "lutaml/model"

require_relative "hierarchical_part"

module LocMods
  class CitySection < Lutaml::Model::Serializable
    attribute :content, HierarchicalPart
    attribute :city_section_type, :string

    xml do
      root "citySection"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "citySectionType", to: :city_section_type
    end
  end
end
