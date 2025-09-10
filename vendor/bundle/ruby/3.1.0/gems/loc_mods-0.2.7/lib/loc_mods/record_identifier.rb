# frozen_string_literal: true

require "lutaml/model"

module LocMods
  class RecordIdentifier < Lutaml::Model::Serializable
    attribute :content, :string
    attribute :source, :string

    xml do
      root "recordIdentifier"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "source", to: :source
    end
  end
end
