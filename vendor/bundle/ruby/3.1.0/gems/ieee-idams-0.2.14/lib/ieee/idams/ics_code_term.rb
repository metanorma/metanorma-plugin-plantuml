# frozen_string_literal: true

module Ieee
  module Idams
    # ICS code with term
    class IcsCodeTerm < Lutaml::Model::Serializable
      attribute :codenum, :string
      attribute :name, :string

      xml do
        root "code_term"
        map_attribute "codenum", to: :codenum
        map_content to: :name
      end
    end
  end
end
