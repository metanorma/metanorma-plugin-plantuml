# frozen_string_literal: true

require "lutaml/model"

require_relative "record"

module LocMods
  class Collection < Lutaml::Model::Serializable
    attribute :mods, Record, collection: true

    xml do
      root "modsCollection"
      namespace "http://www.loc.gov/mods/v3", nil

      map_element "mods", to: :mods
    end
  end
end
