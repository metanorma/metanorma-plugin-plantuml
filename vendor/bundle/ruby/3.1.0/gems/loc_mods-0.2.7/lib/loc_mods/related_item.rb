# frozen_string_literal: true

require "lutaml/model"

require_relative "abstract"
require_relative "access_condition"
require_relative "classification"
require_relative "cartographic_extension"
require_relative "genre"
require_relative "identifier"
require_relative "language"
require_relative "location"
require_relative "origin_info"
require_relative "part"
require_relative "physical_description"
require_relative "physical_description_note"
require_relative "record_info"
require_relative "subject"
require_relative "subject_name"
require_relative "table_of_contents"
require_relative "target_audience"
require_relative "title_info"
require_relative "type_of_resource"

module LocMods
  class RelatedItem < Lutaml::Model::Serializable
    attribute :type, :string
    attribute :other_type, :string
    attribute :other_type_auth, :string
    attribute :other_type_auth_uri, :string
    attribute :other_type_uri, :string
    attribute :display_label, :string
    attribute :id, :string
    attribute :abstract, Abstract, collection: true
    attribute :access_condition, AccessCondition, collection: true
    attribute :classification, Classification, collection: true
    attribute :extension, CartographicExtension, collection: true
    attribute :genre, Genre, collection: true
    attribute :identifier, Identifier, collection: true
    attribute :language, Language, collection: true
    attribute :location, Location, collection: true
    attribute :name, SubjectName, collection: true
    attribute :note, Note, collection: true
    attribute :origin_info, OriginInfo, collection: true
    attribute :part, Part, collection: true
    attribute :physical_description, PhysicalDescription, collection: true
    attribute :record_info, RecordInfo, collection: true
    attribute :related_item, RelatedItem, collection: true
    attribute :subject, Subject, collection: true
    attribute :table_of_contents, TableOfContents, collection: true
    attribute :target_audience, TargetAudience, collection: true
    attribute :title_info, TitleInfo, collection: true
    attribute :type_of_resource, TypeOfResource, collection: true
    attribute :href, :string

    xml do
      root "relatedItem"
      namespace "http://www.loc.gov/mods/v3", nil

      map_attribute "type", to: :type
      map_attribute "otherType", to: :other_type
      map_attribute "otherTypeAuth", to: :other_type_auth
      map_attribute "otherTypeAuthURI", to: :other_type_auth_uri
      map_attribute "otherTypeURI", to: :other_type_uri
      map_attribute "displayLabel", to: :display_label
      map_attribute "ID", to: :id
      map_attribute "href", to: :href,
                            namespace: "http://www.w3.org/1999/xlink",
                            prefix: "xlink"

      map_element "abstract", to: :abstract
      map_element "accessCondition", to: :access_condition
      map_element "classification", to: :classification
      map_element "extension", to: :extension
      map_element "genre", to: :genre
      map_element "identifier", to: :identifier
      map_element "language", to: :language
      map_element "location", to: :location
      map_element "name", to: :name
      map_element "note", to: :note
      map_element "originInfo", to: :origin_info
      map_element "part", to: :part
      map_element "physicalDescription", to: :physical_description
      map_element "recordInfo", to: :record_info
      map_element "relatedItem", to: :related_item
      map_element "subject", to: :subject
      map_element "tableOfContents", to: :table_of_contents
      map_element "targetAudience", to: :target_audience
      map_element "titleInfo", to: :title_info
      map_element "typeOfResource", to: :type_of_resource
    end
  end
end
