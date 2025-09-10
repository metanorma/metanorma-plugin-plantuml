# frozen_string_literal: true

module Ieee
  module Idams
    # Contains information about a volume issue
    class VolumeInfoIssue < Lutaml::Model::Serializable
      # Issue number
      # @return [Integer] issue number
      attribute :amsid, :integer

      # Issue status
      # @return [String] issue status
      attribute :issuestatus, :string

      xml do
        root "issue"
        map_element "amsid", to: :amsid
        map_element "issuestatus", to: :issuestatus
      end
    end
  end
end
