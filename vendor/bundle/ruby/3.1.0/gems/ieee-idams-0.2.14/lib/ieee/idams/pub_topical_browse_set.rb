# frozen_string_literal: true

module Ieee
  module Idams
    # Represents a set of topical browse categories
    class PubTopicalBrowseSet < Lutaml::Model::Serializable
      # List of topical browse categories
      VALID_CATEGORIES = [
        "Aerospace",
        "Bioengineering",
        "Communication, Networking, and Broadcast Technologies",
        "Components, Circuits, Devices and Systems",
        "Computing and Processing",
        "Engineered Materials, Dielectrics and Plasmas",
        "Engineering Profession",
        "Fields, Waves and Electromagnetics",
        "General Topics for Engineers",
        "Geoscience",
        "Nuclear Engineering",
        "Photonics and Electrooptics",
        "Power, Industry and Industry Applications",
        "Robotics and Control Systems",
        "Signal Processing and Analysis",
        "Transportation"
      ].freeze

      # List of topical categories
      # @return [Array<String>] subject classifications
      attribute :pubtopicalbrowse, :string, collection: true,
                                            values: VALID_CATEGORIES, initialize_empty: true

      xml do
        root "pubtopicalbrowseset"
        map_element "pubtopicalbrowse", to: :pubtopicalbrowse
      end

      # def validate
      #   errors = super
      #   pubtopicalbrowse.each do |category|
      #     unless VALID_CATEGORIES.include?(category)
      #       errors << "Invalid topical browse category: #{category}"
      #     end
      #   end
      #   errors
      # end
    end
  end
end
