# frozen_string_literal: true

module Ieee
  module Idams
    # Configuration Groiup
    class ConfGroup < Lutaml::Model::Serializable
      # <confgroup>
      #   <doi_permission>F</doi_permission>
      # </confgroup>

      attribute :doi_permission, :string, collection: true, initialize_empty: true

      xml do
        root "confgroup"
        map_element "doi_permission", to: :doi_permission
      end
    end
  end
end
