# frozen_string_literal: true

require "lutaml/model"

require_relative "hierarchical_part"

module LocMods
  class Region < Lutaml::Model::Serializable
    attribute :content, HierarchicalPart
    attribute :region_type, :string

    xml do
      root "region"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "regionType", to: :region_type
    end
  end
end
