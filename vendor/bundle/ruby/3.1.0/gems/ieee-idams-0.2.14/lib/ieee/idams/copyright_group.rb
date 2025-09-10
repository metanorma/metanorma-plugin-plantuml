# frozen_string_literal: true

require_relative "copyright"

module Ieee
  module Idams
    # Represents a group of copyright information
    class CopyrightGroup < Lutaml::Model::Serializable
      # Copyright entries
      # @return [Array<Copyright>] copyright information
      attribute :copyright, Copyright, collection: true, initialize_empty: true

      xml do
        root "copyrightgroup"
        map_element "copyright", to: :copyright
      end
    end
  end
end
