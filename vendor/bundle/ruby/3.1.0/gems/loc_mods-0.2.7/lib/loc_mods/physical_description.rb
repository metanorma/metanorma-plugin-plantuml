# frozen_string_literal: true

require "lutaml/model"

require_relative "extent"
require_relative "form"
require_relative "physical_description_note"

module LocMods
  class PhysicalDescription < Lutaml::Model::Serializable
    attribute :lang, :string
    attribute :script, :string
    attribute :transliteration, :string
    attribute :display_label, :string
    attribute :alt_rep_group, :string
    attribute :form, Form, collection: true
    attribute :reformatting_quality, :string, collection: true
    attribute :internet_media_type, :string, collection: true
    attribute :extent, Extent, collection: true
    attribute :digital_origin, :string, collection: true
    attribute :note, PhysicalDescriptionNote, collection: true

    xml do
      root "physicalDescription", ordered: true
      namespace "http://www.loc.gov/mods/v3", nil

      map_attribute "lang", to: :lang
      map_attribute "script", to: :script
      map_attribute "transliteration", to: :transliteration
      map_attribute "displayLabel", to: :display_label
      map_attribute "altRepGroup", to: :alt_rep_group
      map_element "form", to: :form
      map_element "reformattingQuality", to: :reformatting_quality
      map_element "internetMediaType", to: :internet_media_type
      map_element "extent", to: :extent
      map_element "digitalOrigin", to: :digital_origin
      map_element "note", to: :note
    end
  end
end
