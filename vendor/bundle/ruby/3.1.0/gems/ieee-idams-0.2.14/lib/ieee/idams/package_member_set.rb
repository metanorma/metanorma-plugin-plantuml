# frozen_string_literal: true

module Ieee
  module Idams
    # Represents a set of package members
    class PackageMemberSet < Lutaml::Model::Serializable
      attribute :package_member, :string, collection: true, initialize_empty: true

      xml do
        root "packagememberset"
        map_element "packagemember", to: :package_member
      end
    end
  end
end
