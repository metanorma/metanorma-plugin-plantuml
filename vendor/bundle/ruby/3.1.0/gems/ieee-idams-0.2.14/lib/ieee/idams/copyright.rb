# frozen_string_literal: true

require_relative "copyright"

module Ieee
  module Idams
    # Represents a copyright entry
    class Copyright < Lutaml::Model::Serializable
      # Copyright year
      # @return [Integer] year of copyright
      attribute :year, :integer

      # Copyright holder
      # @return [String] name of copyright holder
      attribute :holder, :string

      xml do
        root "copyright"
        map_element "year", to: :year
        map_element "holder", to: :holder
      end
    end
  end
end
