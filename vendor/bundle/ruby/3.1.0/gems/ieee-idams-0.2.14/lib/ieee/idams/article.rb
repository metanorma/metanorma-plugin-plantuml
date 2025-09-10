# frozen_string_literal: true

require_relative "article_info"

module Ieee
  module Idams
    # Represents an article within a volume
    class Article < Lutaml::Model::Serializable
      # Article title
      # @return [String] full article title
      attribute :title, :string

      # Article information
      # @return [ArticleInfo] detailed article metadata
      attribute :articleinfo, ArticleInfo

      xml do
        root "article"
        map_element "title", to: :title, cdata: true
        map_element "articleinfo", to: :articleinfo
      end
    end
  end
end
