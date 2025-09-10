# frozen_string_literal: true

module Ieee
  module Idams
    # Article page nums
    class ArticlePageNums < Lutaml::Model::Serializable
      # <artpagenums endpage="28" startpage="1">1-28</artpagenums>

      attribute :endpage, :string
      attribute :startpage, :string
      attribute :formatted, :string

      xml do
        root "artpagenums"

        map_attribute "endpage", to: :endpage, value_map: { to: { empty: :empty } }
        map_attribute "startpage", to: :startpage, value_map: { to: { empty: :empty } }
        map_content to: :formatted
      end
    end
  end
end
