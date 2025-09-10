# frozen_string_literal: true

module Ieee
  module Idams
    # Represents a set of standard packages
    class StandardPackageSet < Lutaml::Model::Serializable
      attribute :standard_package, :string, collection: true, initialize_empty: true

      xml do
        root "standardpackageset"
        map_element "standard_package", to: :standard_package
      end
    end
  end
end
