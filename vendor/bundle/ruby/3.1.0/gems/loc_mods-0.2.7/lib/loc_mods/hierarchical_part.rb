# frozen_string_literal: true

require "lutaml/model"

module LocMods
  class HierarchicalPart < Lutaml::Model::Serializable
    attribute :content, :string
    attribute :level, :string
    attribute :period, :string
    attribute :authority, :string
    attribute :authority_uri, :string
    attribute :value_uri, :string

    xml do
      root "territory"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "level", to: :level
      map_attribute "period", to: :period
      map_attribute "authority", to: :authority
      map_attribute "authorityURI", to: :authority_uri
      map_attribute "valueURI", to: :value_uri
    end
  end
end
