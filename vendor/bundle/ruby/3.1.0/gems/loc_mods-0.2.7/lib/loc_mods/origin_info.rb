# frozen_string_literal: true

require "lutaml/model"

require_relative "date"
require_relative "date_other"
require_relative "place"
require_relative "publisher"
require_relative "edition"

module LocMods
  class OriginInfo < Lutaml::Model::Serializable
    attribute :lang, :string
    attribute :script, :string
    attribute :transliteration, :string
    attribute :display_label, :string
    attribute :alt_rep_group, :string
    attribute :event_type, :string
    attribute :place, Place, collection: true
    attribute :publisher, Publisher, collection: true
    attribute :date_issued, Date, collection: true
    attribute :date_created, Date, collection: true
    attribute :date_captured, Date, collection: true
    attribute :date_valid, Date, collection: true
    attribute :date_modified, Date, collection: true
    attribute :copyright_date, Date, collection: true
    attribute :date_other, DateOther, collection: true
    attribute :edition, Edition, collection: true
    attribute :issuance, :string, collection: true
    attribute :frequency, :string, collection: true

    xml do
      root "originInfo", ordered: true
      namespace "http://www.loc.gov/mods/v3", nil

      map_attribute "lang", to: :lang
      map_attribute "script", to: :script
      map_attribute "transliteration", to: :transliteration
      map_attribute "displayLabel", to: :display_label
      map_attribute "altRepGroup", to: :alt_rep_group
      map_attribute "eventType", to: :event_type

      map_element "place", to: :place
      map_element "publisher", to: :publisher
      map_element "dateIssued", to: :date_issued
      map_element "dateCreated", to: :date_created
      map_element "dateCaptured", to: :date_captured
      map_element "dateValid", to: :date_valid
      map_element "dateModified", to: :date_modified
      map_element "copyrightDate", to: :copyright_date
      map_element "dateOther", to: :date_other
      map_element "issuance", to: :issuance
      map_element "edition", to: :edition
      map_element "frequency", to: :frequency
    end
  end
end
