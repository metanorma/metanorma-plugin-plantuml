# frozen_string_literal: true

require "lutaml/model"

module LocMods
  class EnumerationAndChronology < Lutaml::Model::Serializable
    attribute :content, :string
    attribute :unit_type, :string

    xml do
      root "enumerationAndChronology"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "unitType", to: :unit_type
    end
  end
end
