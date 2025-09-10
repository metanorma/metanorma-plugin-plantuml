# frozen_string_literal: true

module Ieee
  module Idams
    # Contains volume metadata
    class PubSponsor < Lutaml::Model::Serializable
      # IEEE Society that sponsors the publication
      # @return [String] Society name that sponsors the publication
      attribute :society, :string, collection: true, initialize_empty: true

      xml do
        root "pubsponsor"
        map_element "society", to: :society
      end
    end
  end
end
