require "spec_helper"

RSpec.describe Metanorma::Plugin::Plantuml::BlockProcessor do
  let(:temp_dir) { Dir.mktmpdir }

  after do
    FileUtils.rm_rf(temp_dir) if Dir.exist?(temp_dir)
  end

  let(:test_document) { TestDocument.new(temp_dir) }
  let(:test_parent) { TestParent.new(test_document) }
  let(:test_reader) { TestReader.new("@startuml\nAlice -> Bob\n@enduml") }
  let(:processor) { TestBlockProcessor.new }

  describe "DSL configuration" do
    it "is configured with correct settings" do
      expect(described_class.config[:name]).to eq(:plantuml)
      expect(described_class.config[:contexts]).to include(:literal)
      expect(described_class.config[:content_model]).to eq(:raw)
    end
  end

  describe "#abort" do
    it "warns about the error and creates listing block" do
      attrs = { "1" => "plantuml", "id" => "test" }
      msg = "Test error message"

      processor.send(:abort, test_parent, test_reader, attrs, msg)

      expect(processor.warnings).to include(msg)
      expect(processor.created_blocks.last[:type]).to eq(:listing)
      expect(processor.created_blocks.last[:content])
        .to eq("@startuml\nAlice -> Bob\n@enduml")
      expect(processor.created_blocks.last[:attrs])
        .to eq({ "language" => "plantuml", "id" => "test" })
    end

    it "filters out numeric keys from attributes" do
      attrs = { "1" => "plantuml", "id" => "test", "2" => "ignored" }
      msg = "Test error message"

      processor.send(:abort, test_parent, test_reader, attrs, msg)

      created_attrs = processor.created_blocks.last[:attrs]
      expect(created_attrs).to eq({ "language" => "plantuml", "id" => "test" })
      expect(created_attrs).not_to have_key("2")
    end
  end

  describe "integration with real PlantUML" do
    context "when PlantUML wrapper is available" do
      before do
        # Only run if PlantUML is actually available
        skip "PlantUML not available" unless Metanorma::Plugin::Plantuml::Wrapper.available?
      end

      it "processes PlantUML diagrams successfully" do
        attrs = { "id" => "test-diagram" }

        processor.process(test_parent, test_reader, attrs)

        expect(processor.created_blocks.last[:type]).to eq(:image)
        expect(processor.created_blocks.last[:attrs]).to include("target")
        expect(processor.created_blocks.last[:attrs]["target"])
          .to match(/_plantuml_images.*\.png/)
      end
    end

    context "when PlantUML wrapper is not available" do
      it "falls back to source code block" do
        # Create a wrapper that reports unavailable
        original_available = Metanorma::Plugin::Plantuml::Wrapper
          .method(:available?)
        Metanorma::Plugin::Plantuml::Wrapper
          .define_singleton_method(:available?) { false }

        attrs = { "1" => "plantuml" }

        processor.process(test_parent, test_reader, attrs)

        expect(processor.warnings).to include("PlantUML not installed")
        expect(processor.created_blocks.last[:type]).to eq(:listing)
        expect(processor.created_blocks.last[:attrs]["language"])
          .to eq("plantuml")

        # Restore original method
        Metanorma::Plugin::Plantuml::Wrapper.define_singleton_method(
          :available?, original_available
        )
      end
    end
  end

  describe "error handling" do
    it "handles syntax errors gracefully" do
      # Missing @enduml
      invalid_reader = TestReader.new("@startuml\nAlice -> Bob")
      attrs = {}

      processor.process(test_parent, invalid_reader, attrs)

      expect(processor.warnings.last)
        .to match(/@startuml without matching @enduml/)
      expect(processor.created_blocks.last[:type]).to eq(:listing)
      expect(processor.created_blocks.last[:attrs]["language"])
        .to eq("plantuml")
    end
  end
end
