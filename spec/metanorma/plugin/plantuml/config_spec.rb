# frozen_string_literal: true

require "spec_helper"

RSpec.describe Metanorma::Plugin::Plantuml::Config do
  describe "defaults" do
    it "defaults java_path to 'java'" do
      config = described_class.new
      expect(config.java_path).to eq("java")
    end

    it "defaults memory_limit to '1024m'" do
      config = described_class.new
      expect(config.memory_limit).to eq("1024m")
    end

    it "defaults temp_dir to nil" do
      config = described_class.new
      expect(config.temp_dir).to be_nil
    end
  end

  describe "#jvm_options" do
    it "includes stack size and heap limits" do
      config = described_class.new
      options = config.jvm_options

      expect(options).to include("-Xss5m")
      expect(options).to include("-Xmx1024m")
      expect(options).to include("-Djava.awt.headless=true")
    end

    it "uses configured memory limit" do
      config = described_class.new
      config.memory_limit = "2048m"
      options = config.jvm_options

      expect(options).to include("-Xmx2048m")
    end
  end

  describe "configuration via configure block" do
    after do
      Metanorma::Plugin::Plantuml.configuration = nil
    end

    it "allows setting java_path" do
      Metanorma::Plugin::Plantuml.configure do |c|
        c.java_path = "/usr/bin/java"
      end

      expect(Metanorma::Plugin::Plantuml.configuration.java_path)
        .to eq("/usr/bin/java")
    end

    it "allows setting memory_limit" do
      Metanorma::Plugin::Plantuml.configure do |c|
        c.memory_limit = "2048m"
      end

      expect(Metanorma::Plugin::Plantuml.configuration.memory_limit)
        .to eq("2048m")
    end

    it "allows setting temp_dir" do
      Metanorma::Plugin::Plantuml.configure do |c|
        c.temp_dir = "/tmp/plantuml"
      end

      expect(Metanorma::Plugin::Plantuml.configuration.temp_dir)
        .to eq("/tmp/plantuml")
    end
  end
end
