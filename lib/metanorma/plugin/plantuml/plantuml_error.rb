# frozen_string_literal: true

module Metanorma
  module Plugin
    module Plantuml
      class PlantumlError < StandardError
        def initialize(message = nil, original_error = nil)
          super(message)
          @original_error = original_error
        end

        attr_reader :original_error
      end
    end
  end
end
