# frozen_string_literal: true

require "lutaml/model"

require_relative "date"

module LocMods
  class Temporal < Lutaml::Model::Serializable
    attribute :content, Date
    attribute :authority, :string
    attribute :authority_uri, :string
    attribute :value_uri, :string

    xml do
      root "temporal"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "authority", to: :authority
      map_attribute "authorityURI", to: :authority_uri
      map_attribute "valueURI", to: :value_uri
    end
  end
end
