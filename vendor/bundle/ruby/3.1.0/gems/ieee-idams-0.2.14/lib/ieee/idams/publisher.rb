# frozen_string_literal: true

require_relative "address"

module Ieee
  module Idams
    # Represents a publisher
    class Publisher < Lutaml::Model::Serializable
      # Publisher name
      # @return [String] name of publishing organization
      attribute :publishername, :string

      # Publisher location
      # @return [String] publishing location
      attribute :publisherloc, :string

      # Address details
      # @return [Address] publisher's address
      attribute :address, Address

      xml do
        root "publisher"
        map_element "publishername", to: :publishername
        map_element "publisherloc", to: :publisherloc
        map_element "address", to: :address
      end
    end
  end
end
