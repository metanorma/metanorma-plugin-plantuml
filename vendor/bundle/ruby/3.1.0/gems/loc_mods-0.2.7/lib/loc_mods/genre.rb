# frozen_string_literal: true

require "lutaml/model"

module LocMods
  class Genre < Lutaml::Model::Serializable
    attribute :content, :string
    attribute :type, :string
    attribute :display_label, :string
    attribute :alt_rep_group, :string
    attribute :usage, :string
    attribute :authority, :string

    xml do
      root "genre"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "type", to: :type
      map_attribute "displayLabel", to: :display_label
      map_attribute "altRepGroup", to: :alt_rep_group
      map_attribute "usage", to: :usage
      map_attribute "authority", to: :authority
    end
  end
end
