# frozen_string_literal: true

require_relative "multimedia_compressed"
require_relative "multimedia_component"

module Ieee
  module Idams
    # Multimedia
    class Multimedia < Lutaml::Model::Serializable
      # <multimedia>
      #   <summary>The IEEE 1584 calculators can be accessed via the auxiliary files (5), ¿IEEE_1584_Bolted_Fault_Cal.xls¿ and
      # ¿IEEE_1584_Arc_Flash_Hazard.xls¿, and test data can be accessed via the auxiliary files, ¿Data_set.xls¿,
      # ¿Test_results_database.xls¿, and ¿CL_Fuse_test_data.xls¿ provided for use with IEEE 1584-2002.</summary>
      #   <compressed>
      #     <compressedfilename>IEEE1584-2002_AncillaryFiles.zip</compressedfilename>
      #     <compressedfilesize>180</compressedfilesize>
      #     <compressiontype>ZIP</compressiontype>
      #     <environmenttype>Windows</environmenttype>
      #     <readmefile>IEEE1584-2002_AncillaryFiles.readme.txt</readmefile>
      #   </compressed>
      #   <component>
      #     <componentfilename/>
      #     <componentfilesize/>
      #     <componenttype/>
      #     <componentplatform/>
      #     <componentdoi/>
      #   </component>
      # </multimedia>

      attribute :summary, :string
      attribute :compressed, MultimediaCompressed
      attribute :component, MultimediaComponent

      xml do
        root "multimedia"

        map_element "summary", to: :summary
        map_element "compressed", to: :compressed
        map_element "component", to: :component
      end
    end
  end
end
