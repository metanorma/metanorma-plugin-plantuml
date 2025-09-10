# frozen_string_literal: true

require "lutaml/model"
require_relative "non_sort"

module LocMods
  class TitleInfo < Lutaml::Model::Serializable
    attribute :type, :string
    attribute :other_type, :string
    attribute :supplied, :string
    attribute :alt_rep_group, :string
    attribute :alt_format, :string
    attribute :content_type, :string
    attribute :name_title_group, :string
    attribute :usage, :string
    attribute :id, :string
    attribute :authority, :string
    attribute :authority_uri, :string
    attribute :value_uri, :string
    attribute :lang, :string
    attribute :script, :string
    attribute :transliteration, :string
    attribute :display_label, :string
    attribute :title, :string, collection: true
    attribute :sub_title, :string, collection: true
    attribute :part_number, :string, collection: true
    attribute :part_name, :string, collection: true
    attribute :non_sort, NonSort, collection: true

    xml do
      root "titleInfo"
      namespace "http://www.loc.gov/mods/v3", nil

      map_attribute "type", to: :type
      map_attribute "otherType", to: :other_type
      map_attribute "supplied", to: :supplied
      map_attribute "altRepGroup", to: :alt_rep_group
      map_attribute "altFormat", to: :alt_format
      map_attribute "contentType", to: :content_type
      map_attribute "nameTitleGroup", to: :name_title_group
      map_attribute "usage", to: :usage
      map_attribute "ID", to: :id
      map_attribute "authority", to: :authority
      map_attribute "authorityURI", to: :authority_uri
      map_attribute "valueURI", to: :value_uri
      map_attribute "lang", to: :lang
      map_attribute "script", to: :script
      map_attribute "transliteration", to: :transliteration
      map_attribute "displayLabel", to: :display_label

      map_element "nonSort", to: :non_sort
      map_element "title", to: :title
      map_element "subTitle", to: :sub_title
      map_element "partNumber", to: :part_number
      map_element "partName", to: :part_name
    end
  end
end
