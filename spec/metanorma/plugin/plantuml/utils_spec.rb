# frozen_string_literal: true

require "spec_helper"

RSpec.describe Metanorma::Plugin::Plantuml::Utils do
  describe ".localdir" do
    it "returns docfile directory when docfile is set" do
      document = TestDocument.new("/tmp", "docfile" => "/tmp/test.adoc")

      expect(described_class.localdir(document)).to eq("/tmp")
    end

    it "falls back to docdir when docfile is not set" do
      document = TestDocument.new("/tmp", "docdir" => "/custom/dir")
      document.attributes.delete("docfile")

      expect(described_class.localdir(document)).to eq("/custom/dir")
    end

    it "falls back to localdir attribute" do
      document = TestDocument.new("/tmp", "localdir" => "/local/dir")
      document.attributes.delete("docfile")
      document.attributes.delete("docdir")

      expect(described_class.localdir(document)).to eq("/local/dir")
    end

    it "falls back to current directory" do
      document = TestDocument.new("/tmp")
      document.attributes.delete("docfile")
      document.attributes.delete("docdir")
      document.attributes.delete("localdir")

      expect(described_class.localdir(document)).to eq(File.dirname("."))
    end
  end

  describe ".generate_timestamp" do
    it "returns a timestamp string in expected format" do
      timestamp = described_class.generate_timestamp
      expect(timestamp).to match(/^\d{8}_\d{6}_\d{3}$/)
    end

    it "contains date and time components" do
      timestamp = described_class.generate_timestamp
      year = Time.now.year.to_s
      expect(timestamp).to start_with(year)
    end
  end
end
