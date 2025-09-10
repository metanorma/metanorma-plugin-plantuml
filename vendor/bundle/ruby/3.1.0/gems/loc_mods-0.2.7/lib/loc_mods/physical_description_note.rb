# frozen_string_literal: true

require "lutaml/model"

module LocMods
  class PhysicalDescriptionNote < Lutaml::Model::Serializable
    attribute :content, :string
    attribute :display_label, :string
    attribute :type, :string
    attribute :type_uri, :string
    attribute :id, :string

    xml do
      root "physicalDescriptionNote"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "displayLabel", to: :display_label
      map_attribute "type", to: :type
      map_attribute "typeURI", to: :type_uri
      map_attribute "ID", to: :id
    end
  end
end
