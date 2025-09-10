# frozen_string_literal: true

module Ieee
  module Idams
    # Multimedia component
    class MultimediaComponent < Lutaml::Model::Serializable
      #   <component>
      #     <componentfilename/>
      #     <componentfilesize/>
      #     <componenttype/>
      #     <componentplatform/>
      #     <componentdoi/>
      #   </component>

      attribute :filename, :string
      attribute :filesize, :string
      attribute :type, :string
      attribute :platform, :string
      attribute :doi, :string

      xml do
        root "component"

        map_element "componentfilename", to: :filename, render_nil: true
        map_element "componentfilesize", to: :filesize, render_nil: true
        map_element "componenttype", to: :type, render_nil: true
        map_element "componentplatform", to: :platform, render_nil: true
        map_element "componentdoi", to: :doi, render_nil: true
      end
    end
  end
end
