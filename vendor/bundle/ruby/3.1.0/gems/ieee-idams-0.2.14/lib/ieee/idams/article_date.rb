# frozen_string_literal: true

module Ieee
  module Idams
    # Article related date
    class ArticleDate < Lutaml::Model::Serializable
      # <date datetype="OriginalPub">
      #   <year>1997</year>
      #   <month>April</month>
      #   <day>3</day>
      # </date>
      # <date datetype="ePub">
      #   <year>2019</year>
      #   <month>4</month>
      #   <day>26</day>
      # </date>

      attribute :datetype, :string
      attribute :year, :string
      attribute :month, :string
      attribute :day, :string

      xml do
        root "date"

        map_attribute "datetype", to: :datetype
        map_element "year", to: :year
        map_element "month", to: :month
        map_element "day", to: :day
      end
    end
  end
end
