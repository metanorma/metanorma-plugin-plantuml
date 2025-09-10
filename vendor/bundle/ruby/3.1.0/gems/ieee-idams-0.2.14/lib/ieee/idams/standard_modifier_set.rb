# frozen_string_literal: true

module Ieee
  module Idams
    # Represents a set of standard modifiers
    class StandardModifierSet < Lutaml::Model::Serializable
      attribute :standard_modifier, :string

      xml do
        root "standardmodifierset"
        map_element "standard_modifier", to: :standard_modifier
      end
    end
  end
end
