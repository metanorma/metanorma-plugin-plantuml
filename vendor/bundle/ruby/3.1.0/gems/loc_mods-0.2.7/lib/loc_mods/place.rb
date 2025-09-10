# frozen_string_literal: true

require "lutaml/model"

require_relative "place_term"

module LocMods
  class Place < Lutaml::Model::Serializable
    attribute :supplied, :string
    attribute :place_term, PlaceTerm, collection: true

    xml do
      root "place"
      namespace "http://www.loc.gov/mods/v3", nil

      map_attribute "supplied", to: :supplied
      map_element "placeTerm", to: :place_term
    end
  end
end
