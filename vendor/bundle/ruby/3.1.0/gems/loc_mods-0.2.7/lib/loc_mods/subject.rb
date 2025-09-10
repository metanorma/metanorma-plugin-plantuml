# frozen_string_literal: true

require "lutaml/model"

require_relative "cartographics"
require_relative "genre"
require_relative "geographic_code"
require_relative "hierarchical_geographic"
require_relative "subject_name"
require_relative "subject_title_info"
require_relative "temporal"
require_relative "occupation"

module LocMods
  class Subject < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :authority, :string
    attribute :authority_uri, :string
    attribute :value_uri, :string
    attribute :lang, :string
    attribute :script, :string
    attribute :transliteration, :string
    attribute :display_label, :string
    attribute :alt_rep_group, :string
    attribute :usage, :string
    attribute :topic, :string, collection: true
    attribute :geographic, :string, collection: true
    attribute :temporal, Temporal, collection: true
    attribute :title_info, SubjectTitleInfo, collection: true
    attribute :name, SubjectName, collection: true
    attribute :geographic_code, GeographicCode, collection: true
    attribute :hierarchical_geographic, HierarchicalGeographic, collection: true
    attribute :cartographics, Cartographics, collection: true
    attribute :occupation, Occupation, collection: true
    attribute :genre, Genre, collection: true
    attribute :href, :string

    xml do
      root "subject", ordered: true
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
      map_attribute "usage", to: :usage

      map_element "name", to: :name
      map_element "titleInfo", to: :title_info
      map_element "topic", to: :topic
      map_element "geographic", to: :geographic
      map_element "temporal", to: :temporal
      map_element "geographicCode", to: :geographic_code
      map_element "hierarchicalGeographic", to: :hierarchical_geographic
      map_element "cartographics", to: :cartographics
      map_element "occupation", to: :occupation
      map_element "genre", to: :genre
    end
  end
end
