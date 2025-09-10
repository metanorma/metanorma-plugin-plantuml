# frozen_string_literal: true

require "lutaml/model"

module LocMods
  class Identifier < Lutaml::Model::Serializable
    attribute :content, :string
    attribute :display_label, :string
    attribute :type, :string
    attribute :type_uri, :string
    attribute :invalid, :string
    attribute :alt_rep_group, :string

    xml do
      root "nameIdentifier"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "displayLabel", to: :display_label
      map_attribute "type", to: :type
      map_attribute "typeURI", to: :type_uri
      map_attribute "invalid", to: :invalid
      map_attribute "altRepGroup", to: :alt_rep_group
    end
  end
end
