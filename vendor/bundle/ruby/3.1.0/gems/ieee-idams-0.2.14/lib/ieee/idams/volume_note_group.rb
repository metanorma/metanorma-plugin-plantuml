# frozen_string_literal: true

module Ieee
  module Idams
    # Group of notes
    class VolumeNoteGroup < Lutaml::Model::Serializable
      # Textual note
      # @return [String] A textual note
      attribute :note, :string, collection: true, initialize_empty: true

      xml do
        root "notegroup"
        map_element "note", to: :note
      end
    end
  end
end
