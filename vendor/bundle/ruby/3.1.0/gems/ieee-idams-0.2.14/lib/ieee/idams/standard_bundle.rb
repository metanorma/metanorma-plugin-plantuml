# frozen_string_literal: true

module Ieee
  module Idams
    # Standard Bundle
    class StandardBundle < Lutaml::Model::Serializable
      # <standard_bundle>
      #   <bundle_name>American National Standard Recommended Practice for an On-Site, Ad Hoc Test Method for Estimating Electromagnetic Immunity of Medical Devices to Radiated Radio-Frequency (RF) Emissions from RF Transmitters - Redline</bundle_name>
      #   <bundle_type>Suggested</bundle_type>
      #   <base_standard_product_number>STD98685</base_standard_product_number>
      #   <bundle_product_number>STDRL98685</bundle_product_number>
      # </standard_bundle>

      # Bundle name
      # @return [String] bundle name
      # @example "American ..."
      attribute :bundle_name, :string

      # Bundle type
      # @return [String] bundle type
      # @example "Suggested"
      attribute :bundle_type, :string

      # Base standard product number
      # @return [String] base standard product number
      # @example "STD98685"
      attribute :base_standard_product_number, :string

      # Bundle product number
      # @return [String] bundle product number
      # @example "STDRL98685"
      attribute :bundle_product_number, :string

      xml do
        root "standard_bundle"
        map_element "bundle_name", to: :bundle_name
        map_element "bundle_type", to: :bundle_type
        map_element "base_standard_product_number", to: :base_standard_product_number
        map_element "bundle_product_number", to: :bundle_product_number
      end
    end
  end
end
