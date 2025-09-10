# frozen_string_literal: true

require "lutaml/model"

module LocMods
  class Date < Lutaml::Model::Serializable
    attribute :content, :string
    attribute :encoding, :string
    attribute :qualifier, :string
    attribute :point, :string
    attribute :key_date, :string
    attribute :calendar, :string

    xml do
      root "recordChangeDate"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "encoding", to: :encoding
      map_attribute "qualifier", to: :qualifier
      map_attribute "point", to: :point
      map_attribute "keyDate", to: :key_date
      map_attribute "calendar", to: :calendar
    end
  end
end
