# frozen_string_literal: true

require_relative "volume_info"
require_relative "article"

module Ieee
  module Idams
    # Represents a volume containing articles
    class Volume < Lutaml::Model::Serializable
      # Volume information
      # @return [VolumeInfo] volume metadata
      attribute :volumeinfo, VolumeInfo

      # List of articles
      # @return [Article] articles in volume
      attribute :article, Article

      xml do
        root "volume"
        map_element "volumeinfo", to: :volumeinfo
        map_element "article", to: :article
      end
    end
  end
end
