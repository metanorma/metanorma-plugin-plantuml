# frozen_string_literal: true

require_relative "volume_info_issue"
require_relative "volume_note_group"

module Ieee
  module Idams
    # Contains volume metadata
    class VolumeInfo < Lutaml::Model::Serializable
      # Publication year
      # @return [Integer] year of publication
      attribute :year, :integer

      # System ID
      # @return [String] IDAMS internal ID
      attribute :idamsid, :string

      # Note group
      # @return [VolumeNoteGroup] group of notes
      attribute :note_group, VolumeNoteGroup

      # Issue information
      # @return [VolumeInfoIssue] detailed issue metadata
      attribute :issue, VolumeInfoIssue

      xml do
        root "volumeinfo"
        map_element "year", to: :year
        map_element "idamsid", to: :idamsid
        map_element "notegroup", to: :note_group
        map_element "issue", to: :issue
      end
    end
  end
end
