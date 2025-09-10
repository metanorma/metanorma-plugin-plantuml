# frozen_string_literal: true

require "lutaml/model"

require_relative "alternative_name"
require_relative "identifier"
require_relative "name_part"
require_relative "role"

module LocMods
  class Name < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :authority, :string
    attribute :authority_uri, :string
    attribute :value_uri, :string
    attribute :lang, :string
    attribute :script, :string
    attribute :transliteration, :string
    attribute :display_label, :string
    attribute :alt_rep_group, :string
    attribute :name_title_group, :string
    attribute :usage, :string
    attribute :type, :string
    attribute :name_part, NamePart, collection: true
    attribute :display_form, :string, collection: true
    attribute :affiliation, :string, collection: true
    attribute :role, Role, collection: true
    attribute :description, :string, collection: true
    attribute :name_identifier, Identifier, collection: true
    attribute :alternative_name, AlternativeName, collection: true
    attribute :etal, :string
    attribute :href, :string

    xml do
      root "name"
      namespace "http://www.loc.gov/mods/v3", nil

      map_attribute "href", to: :href,
                            namespace: "http://www.w3.org/1999/xlink",
                            prefix: "xlink"

      map_attribute "ID", to: :id
      map_attribute "authority", to: :authority
      map_attribute "authorityURI", to: :authority_uri
      map_attribute "valueURI", to: :value_uri
      map_attribute "lang", to: :lang
      map_attribute "script", to: :script
      map_attribute "transliteration", to: :transliteration
      map_attribute "displayLabel", to: :display_label
      map_attribute "altRepGroup", to: :alt_rep_group
      map_attribute "nameTitleGroup", to: :name_title_group
      map_attribute "usage", to: :usage
      map_attribute "type", to: :type

      map_element "namePart", to: :name_part
      map_element "displayForm", to: :display_form
      map_element "affiliation", to: :affiliation
      map_element "role", to: :role
      map_element "description", to: :description
      map_element "nameIdentifier", to: :name_identifier
      map_element "alternativeName", to: :alternative_name
      map_element "etal", to: :etal
    end
  end
end
