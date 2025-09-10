# frozen_string_literal: true

require_relative "author"

module Ieee
  module Idams
    # Represents a group of authors
    class AuthorGroup < Lutaml::Model::Serializable
      # List of authors
      # @return [Array<Author>] authors of the work
      attribute :author, Author, collection: true, initialize_empty: true

      xml do
        root "authorgroup"
        map_element "author", to: :author
      end
    end
  end
end
