# frozen_string_literal: true

require "lutaml/model"

require_relative "hierarchical_part"

module LocMods
  class Area < Lutaml::Model::Serializable
    attribute :content, HierarchicalPart
    attribute :area_type, :string

    xml do
      root "area"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "areaType", to: :area_type
    end
  end
end
