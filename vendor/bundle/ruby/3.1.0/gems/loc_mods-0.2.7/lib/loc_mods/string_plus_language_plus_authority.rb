# frozen_string_literal: true

require "lutaml/model"

module LocMods
  class StringPlusLanguagePlusAuthority < Lutaml::Model::Serializable
    attribute :content, :string
    attribute :authority, :string
    attribute :authority_uri, :string
    attribute :value_uri, :string
  end
end
