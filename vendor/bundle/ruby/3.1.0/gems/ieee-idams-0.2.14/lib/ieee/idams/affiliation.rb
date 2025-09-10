# frozen_string_literal: true

require_relative "affiliation_address"

module Ieee
  module Idams
    # Represents an institutional affiliation
    class Affiliation < Lutaml::Model::Serializable
      # AMS ID
      # @return [Integer] author's AMS ID
      attribute :amsid, :integer

      # Organization name
      # @return [String] institution name
      attribute :orgname, :string

      # Organization division
      # @return [String] department or division
      attribute :orgdiv, :string

      # Address information
      # @return [Address] institutional address
      attribute :address, AffiliationAddress

      xml do
        root "affn"
        map_element "amsid", to: :amsid
        map_element "orgname", to: :orgname, cdata: true
        map_element "orgdiv", to: :orgdiv
        map_element "address", to: :address
      end
    end
  end
end
