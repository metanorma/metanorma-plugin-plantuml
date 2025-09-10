# frozen_string_literal: true

module Ieee
  module Idams
    # Multimedia compressed
    class MultimediaCompressed < Lutaml::Model::Serializable
      #   <compressed>
      #     <compressedfilename>IEEE1584-2002_AncillaryFiles.zip</compressedfilename>
      #     <compressedfilesize>180</compressedfilesize>
      #     <compressiontype>ZIP</compressiontype>
      #     <environmenttype>Windows</environmenttype>
      #     <readmefile>IEEE1584-2002_AncillaryFiles.readme.txt</readmefile>
      #   </compressed>

      attribute :filename, :string
      attribute :filesize, :string
      attribute :compression_type, :string
      attribute :environment_type, :string
      attribute :readme_file, :string

      xml do
        root "compressed"

        map_element "compressedfilename", to: :filename
        map_element "compressedfilesize", to: :filesize
        map_element "compressiontype", to: :compression_type
        map_element "environmenttype", to: :environment_type
        map_element "readmefile", to: :readme_file
      end
    end
  end
end
