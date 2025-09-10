# frozen_string_literal: true

require "lutaml/model"

require_relative "cartographic_extension"
require_relative "holding_simple"
require_relative "physical_location"
require_relative "url"

module LocMods
  class Location < Lutaml::Model::Serializable
    attribute :lang, :string
    attribute :script, :string
    attribute :transliteration, :string
    attribute :display_label, :string
    attribute :alt_rep_group, :string
    attribute :physical_location, PhysicalLocation, collection: true
    attribute :shelf_locator, :string, collection: true
    attribute :url, Url, collection: true
    attribute :holding_simple, HoldingSimple
    attribute :holding_external, CartographicExtension

    xml do
      root "location"
      namespace "http://www.loc.gov/mods/v3", nil

      map_attribute "lang", to: :lang
      map_attribute "script", to: :script
      map_attribute "transliteration", to: :transliteration
      map_attribute "displayLabel", to: :display_label
      map_attribute "altRepGroup", to: :alt_rep_group
      map_element "physicalLocation", to: :physical_location
      map_element "shelfLocator", to: :shelf_locator
      map_element "url", to: :url
      map_element "holdingSimple", to: :holding_simple
      map_element "holdingExternal", to: :holding_external
    end
  end
end
