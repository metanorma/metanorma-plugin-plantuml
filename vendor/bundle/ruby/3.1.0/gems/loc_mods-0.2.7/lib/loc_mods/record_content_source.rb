# frozen_string_literal: true

require "lutaml/model"

module LocMods
  class RecordContentSource < Lutaml::Model::Serializable
    attribute :authority, :string
    attribute :content, :string

    xml do
      root "RecordContentSource"
      map_content to: :content

      map_attribute "authority", to: :authority
    end
  end
end
