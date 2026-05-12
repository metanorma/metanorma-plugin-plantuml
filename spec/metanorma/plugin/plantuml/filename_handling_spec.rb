# frozen_string_literal: true

require "spec_helper"

RSpec.describe Metanorma::Plugin::Plantuml::FilenameResolver do
  describe ".extract" do
    it "extracts filename from @startuml with simple name" do
      content = "@startuml PERT\nAlice -> Bob\n@enduml"
      expect(described_class.extract(content)).to eq("PERT")
    end

    it "extracts raw filename from quoted name with spaces" do
      content = <<~CONTENT
        @startebnf "My Number"
        PDF_IntegerObject = "1-9";
        @endebnf
      CONTENT

      expect(described_class.extract(content)).to eq("My Number")
    end

    it "extracts filename from different diagram types" do
      json_no_name = "@startjson\n{\"key\": \"value\"}\n@endjson"
      expect(described_class.extract(json_no_name)).to be_nil

      yaml_no_name = "@startyaml\nkey: value\n@endyaml"
      expect(described_class.extract(yaml_no_name)).to be_nil

      salt_no_name = "@startsalt\n{Hello}\n@endsalt"
      expect(described_class.extract(salt_no_name)).to be_nil

      gantt_no_name = "@startgantt\n[Task] requires 5 days\n@endgantt"
      expect(described_class.extract(gantt_no_name)).to be_nil

      json_with_name = "@startjson filename\n{\"key\": \"value\"}\n@endjson"
      expect(described_class.extract(json_with_name)).to eq("filename")

      yaml_with_name = "@startyaml \"my yaml\"\nkey: value\n@endyaml"
      expect(described_class.extract(yaml_with_name)).to eq("my yaml")
    end

    it "returns nil for content without @start directive" do
      expect(described_class.extract("Alice -> Bob")).to be_nil
    end

    it "returns nil when @start has no filename" do
      expect(described_class.extract("@startuml\nAlice -> Bob\n@enduml"))
        .to be_nil
    end
  end

  describe ".sanitize" do
    it "sanitizes filenames with spaces" do
      expect(described_class.sanitize("My Number")).to eq("My_Number")
    end

    it "sanitizes filenames with yaml-like names" do
      expect(described_class.sanitize("my yaml")).to eq("my_yaml")
    end

    it "prevents path traversal in filenames" do
      dangerous_filenames = [
        "../../../etc/passwd",
        "/tmp/dangerous_overwrite",
        '\\Windows\\System32\\config',
        "../../important/file",
      ]

      dangerous_filenames.each do |dangerous_name|
        sanitized = described_class.sanitize(dangerous_name)

        expect(sanitized).not_to include("/")
        expect(sanitized).not_to include("\\")
        expect(sanitized).not_to include("..")
        expect(sanitized).to match(/^[a-zA-Z0-9_\-.]+$/)
      end
    end

    it "preserves safe filenames" do
      safe_filenames = [
        "PERT",
        "My_Diagram",
        "test-file",
        "diagram.backup",
      ]

      safe_filenames.each do |safe_name|
        expect(described_class.sanitize(safe_name)).to eq(safe_name)
      end
    end

    it "removes quotes before sanitizing" do
      expect(described_class.sanitize('"My Number"')).to eq("My_Number")
    end

    it "collapses multiple underscores" do
      expect(described_class.sanitize("a___b")).to eq("a_b")
    end

    it "removes leading and trailing special characters" do
      expect(described_class.sanitize("___test___")).to eq("test")
    end
  end

  describe "integration with Backend" do
    let(:temp_dir) { Dir.mktmpdir }

    after do
      FileUtils.rm_rf(temp_dir)
    end

    let(:test_document) { TestDocument.new(temp_dir) }
    let(:test_parent) { TestParent.new(test_document) }

    before do
      skip "PlantUML not available" unless Metanorma::Plugin::Plantuml::Wrapper.available?
    end

    it "processes plantuml-lrg-4-7.puml with filename PERT" do
      fixture_content = File.read(fixtures_path("plantuml-lrg-4-7.puml"),
                                  encoding: "UTF-8")

      result = Metanorma::Plugin::Plantuml::Backend
        .generate_file(test_parent, fixture_content)

      expect(result).to match(%r{_plantuml_images/PERT\.png})
    end

    it "processes plantuml-lrg-25-10-1.puml with includedirs" do
      fixture_content = File.read(fixtures_path("plantuml-lrg-25-10-1.puml"),
                                  encoding: "UTF-8")

      result = Metanorma::Plugin::Plantuml::Backend
        .generate_file(
          test_parent, fixture_content,
          options: { includedirs: [fixtures_path(".")] }
        )

      expect(result).to match(%r{_plantuml_images/plantuml_(.){1,999}.png})
    end

    it "processes plantuml-custom-filename.puml with quoted filename" do
      fixture_content = File.read(
        fixtures_path("plantuml-custom-filename.puml"),
        encoding: "UTF-8",
      )

      result = Metanorma::Plugin::Plantuml::Backend
        .generate_file(test_parent, fixture_content)

      expect(result).to match(%r{_plantuml_images/My_Number\.png})
    end
  end
end
