# frozen_string_literal: true

require "lutaml/model"

module LocMods
  class StringPlusLanguagePlusSupplied < Lutaml::Model::Serializable
    attribute :content, :string
    attribute :supplied, :string
  end
end
