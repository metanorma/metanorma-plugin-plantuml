# frozen_string_literal: true

module Ieee
  module Idams
    # Product number
    class ProductNumber < Lutaml::Model::Serializable
      # <productnumber pubtype="Online">STDWD94477</productnumber>

      attribute :pubtype, :string
      attribute :value, :string

      xml do
        root "productnumber"
        map_attribute "pubtype", to: :pubtype
        map_content to: :value
      end
    end
  end
end
