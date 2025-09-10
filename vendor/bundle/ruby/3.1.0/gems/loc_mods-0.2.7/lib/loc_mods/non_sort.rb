# frozen_string_literal: true

require "lutaml/model"

module LocMods
  class NonSort < Lutaml::Model::Serializable
    attribute :content, :string
    attribute :space, :string

    xml do
      root "nonSort"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "space", to: :space,
                             namespace: "http://www.w3.org/XML/1998/namespace", prefix: "xml"
    end
  end
end
