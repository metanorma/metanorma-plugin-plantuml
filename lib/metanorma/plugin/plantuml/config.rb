# frozen_string_literal: true

require "rbconfig"

module Metanorma
  module Plugin
    module Plantuml
      class Config
        attr_accessor :java_path, :memory_limit, :output_dir, :temp_dir

        def initialize
          @java_path = "java"
          @memory_limit = "1024m"
          @output_dir = nil
          @temp_dir = nil
        end

        def jvm_options
          options = [
            "-Xss5m",
            "-Xmx#{memory_limit}",
            "-Djava.awt.headless=true",
          ]

          options << "-Dapple.awt.UIElement=true" if RbConfig::CONFIG["host_os"].match?(/darwin|mac os/)

          options
        end

        def java_command
          [java_path, *jvm_options]
        end
      end

      class << self
        attr_writer :configuration
      end

      def self.configuration
        @configuration ||= Config.new
      end

      def self.configure
        yield(configuration)
      end
    end
  end
end
