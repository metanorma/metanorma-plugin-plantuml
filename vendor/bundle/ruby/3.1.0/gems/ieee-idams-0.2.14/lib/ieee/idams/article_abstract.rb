# frozen_string_literal: true

module Ieee
  module Idams
    # Represents an article abstract
    class ArticleAbstract < Lutaml::Model::Serializable
      # Abstract type
      # @return [String] type of abstract
      attribute :abstract_type, :string

      # Abstract value
      # @return [String] abstract text
      attribute :value, :string

      xml do
        root "abstract"
        map_attribute "abstracttype", to: :abstract_type
        map_content to: :value, cdata: true
      end
    end
  end
end
