# frozen_string_literal: true

require_relative "ics_code_term"

module Ieee
  module Idams
    # ICS Codes
    class IcsCodes < Lutaml::Model::Serializable
      attribute :code_term, IcsCodeTerm, collection: true, initialize_empty: true

      xml do
        root "icscodes"
        map_element "code_term", to: :code_term
      end
    end
  end
end
