# frozen_string_literal: true

require_relative "affiliation"

module Ieee
  module Idams
    # Represents a group of institutional affiliations
    class AffiliationGroup < Lutaml::Model::Serializable
      # List of affiliations
      # @return [Array<Affiliation>] institutional affiliations
      attribute :affn, Affiliation, collection: true, initialize_empty: true

      xml do
        root "affgrp"
        map_element "affn", to: :affn
      end
    end
  end
end
