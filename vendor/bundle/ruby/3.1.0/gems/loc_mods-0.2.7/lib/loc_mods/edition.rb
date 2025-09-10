# frozen_string_literal: true

require "lutaml/model"

module LocMods
  # LocMods::StringPlusLanguagePlusSupplied
  class Edition < Lutaml::Model::Serializable
    attribute :content, :string
    attribute :supplied, :string

    xml do
      root "edition"
      namespace "http://www.loc.gov/mods/v3", nil

      map_content to: :content
      map_attribute "supplied", to: :supplied
    end
  end
end
