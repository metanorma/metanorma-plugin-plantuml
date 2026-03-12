# frozen_string_literal: true

require "rbconfig"

module Metanorma
  module Plugin
    module Plantuml
      class Config
        attr_accessor :java_path, :memory_limit, :temp_dir

        def initialize
          @java_path = "java"
          @memory_limit = "1024m"
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
      end
    end
  end
end
