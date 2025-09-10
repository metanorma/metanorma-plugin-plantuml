# frozen_string_literal: true

require "lutaml/model"

require_relative "enumeration_and_chronology"
require_relative "form"
require_relative "item_identifier"
require_relative "note"

module LocMods
  class CopyInformation < Lutaml::Model::Serializable
    attribute :form, Form
    attribute :sub_location, :string, collection: true
    attribute :shelf_locator, :string, collection: true
    attribute :electronic_locator, :string, collection: true
    attribute :note, Note, collection: true
    attribute :enumeration_and_chronology, EnumerationAndChronology,
              collection: true
    attribute :item_identifier, ItemIdentifier, collection: true

    xml do
      root "copyInformation"
      namespace "http://www.loc.gov/mods/v3", nil

      map_element "form", to: :form
      map_element "subLocation", to: :sub_location
      map_element "shelfLocator", to: :shelf_locator
      map_element "electronicLocator", to: :electronic_locator
      map_element "note", to: :note
      map_element "enumerationAndChronology", to: :enumeration_and_chronology
      map_element "itemIdentifier", to: :item_identifier
    end
  end
end
