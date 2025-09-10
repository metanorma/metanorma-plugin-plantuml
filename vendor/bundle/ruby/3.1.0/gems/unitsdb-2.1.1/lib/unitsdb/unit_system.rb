# frozen_string_literal: true

require_relative "identifier"
require_relative "localized_string"

module Unitsdb
  class UnitSystem < Lutaml::Model::Serializable
    # model Config.model_for(:unit_system)

    attribute :identifiers, Identifier, collection: true
    attribute :names, LocalizedString, collection: true
    attribute :short, :string
    attribute :acceptable, :boolean
  end
end
