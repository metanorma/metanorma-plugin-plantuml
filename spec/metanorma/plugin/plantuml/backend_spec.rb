# frozen_string_literal: true

require "spec_helper"

RSpec.describe Metanorma::Plugin::Plantuml::Backend do
  let(:temp_dir) { Dir.mktmpdir }

  after do
    FileUtils.rm_rf(temp_dir)
  end

  let(:test_document) { TestDocument.new(temp_dir) }
  let(:test_parent) { TestParent.new(test_document) }

  describe ".validate_source" do
    context "with complete PlantUML source" do
      it "returns without error" do
        expect do
          described_class.validate_source("@startuml\nAlice -> Bob\n@enduml")
        end.not_to raise_error
      end
    end

    context "with incomplete PlantUML source" do
      it "raises GenerationError for missing delimiters" do
        expect { described_class.validate_source("Alice -> Bob") }
          .to raise_error(
            Metanorma::Plugin::Plantuml::GenerationError,
            /PlantUML content must start with @start\.\.\. directive!/,
          )
      end
    end

    context "with @startuml but no @enduml" do
      it "raises GenerationError" do
        expect { described_class.validate_source("@startuml\nAlice -> Bob") }
          .to raise_error(
            Metanorma::Plugin::Plantuml::GenerationError,
            /@startuml without matching @enduml in PlantUML!/,
          )
      end
    end

    context "with different diagram types" do
      it "validates @startjson/@endjson" do
        json_src = "@startjson\n{\"key\": \"value\"}\n@endjson"
        expect do
          described_class.validate_source(json_src)
        end.not_to raise_error
      end

      it "detects mismatched diagram types" do
        expect do
          described_class.validate_source("@startuml\nAlice -> Bob\n@endjson")
        end.to raise_error(Metanorma::Plugin::Plantuml::GenerationError)
      end
    end
  end

  describe ".generate_attrs" do
    it "filters and returns only supported attributes" do
      input_attrs = {
        "id" => "test-id",
        "align" => "center",
        "width" => "300",
        "height" => "200",
        "title" => "Test Diagram",
        "role" => "diagram",
        "alt" => "Alternative text",
        "float" => "left",
        "extra" => "ignored",
      }

      result = described_class.generate_attrs(input_attrs)

      expected = {
        "id" => "test-id",
        "align" => "center",
        "width" => "300",
        "height" => "200",
        "title" => "Test Diagram",
        "role" => "diagram",
        "alt" => "Alternative text",
        "float" => "left",
      }

      expect(result).to eq(expected)
      expect(result).not_to have_key("extra")
    end

    it "handles missing attributes gracefully" do
      minimal_attrs = { "id" => "test" }
      result = described_class.generate_attrs(minimal_attrs)

      expect(result).to eq({ "id" => "test" })
    end
  end

  describe ".localdir" do
    it "returns the document's local directory" do
      result = described_class.localdir(test_parent)
      expect(result).to eq(temp_dir)
    end

    it "raises GenerationError when directory is not writable" do
      read_only_dir = File.join(temp_dir, "readonly")
      Dir.mkdir(read_only_dir)
      File.chmod(0o444, read_only_dir)

      document = TestDocument.new(read_only_dir, {})
      parent = TestParent.new(document)

      expect { described_class.localdir(parent) }
        .to raise_error(Metanorma::Plugin::Plantuml::GenerationError,
                        /Destination directory .* not writable for PlantUML!/)

      File.chmod(0o755, read_only_dir)
    end
  end

  describe ".path_prep" do
    it "creates and validates PlantUML images directory" do
      localdir = temp_dir
      imagesdir = "images"

      absolute_path, relative_path = described_class.path_prep(localdir,
                                                               imagesdir)

      expect(absolute_path.to_s).to eq(File.join(temp_dir, "_plantuml_images"))
      expect(relative_path).to eq("../_plantuml_images")
      expect(Dir.exist?(absolute_path)).to be true
    end

    it "handles nil imagesdir" do
      localdir = temp_dir
      imagesdir = nil

      absolute_path, relative_path = described_class.path_prep(localdir,
                                                               imagesdir)

      expect(absolute_path.to_s).to eq(File.join(temp_dir, "_plantuml_images"))
      expect(relative_path).to eq("_plantuml_images")
      expect(Dir.exist?(absolute_path)).to be true
    end
  end

  describe ".generate_file_prep" do
    it "returns localdir, imagesdir, and format" do
      ldir, imagesdir, fmt = described_class.generate_file_prep(test_parent)

      expect(ldir).to eq(temp_dir)
      expect(imagesdir).to eq("images")
      expect(fmt).to eq("png")
    end

    it "defaults to png format when not specified" do
      document = TestDocument.new(temp_dir, "plantuml-image-format" => nil)
      parent = TestParent.new(document)

      _, _, fmt = described_class.generate_file_prep(parent)

      expect(fmt).to eq("png")
    end

    it "handles svg format" do
      document = TestDocument.new(temp_dir, "plantuml-image-format" => "svg")
      parent = TestParent.new(document)

      _, _, fmt = described_class.generate_file_prep(parent)

      expect(fmt).to eq("svg")
    end
  end
end
