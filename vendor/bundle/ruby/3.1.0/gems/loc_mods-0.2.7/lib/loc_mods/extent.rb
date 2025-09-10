# frozen_string_literal: true

require "lutaml/model"

module LocMods
  class Extent < Lutaml::Model::Serializable
    attribute :content, :string
    attribute :unit, :string

    xml do
      root "extent"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "unit", to: :unit
    end
  end
end
