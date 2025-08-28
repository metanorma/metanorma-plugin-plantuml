require "spec_helper"

RSpec.describe Metanorma::Plugin::Plantuml::Wrapper do
  describe ".available?" do
    it "returns false when JAR is not available" do
      allow(File).to receive(:exist?)
        .with(described_class::PLANTUML_JAR_PATH).and_return(false)
      expect(described_class.available?).to be false
    end
  end

  describe ".generate" do
    let(:simple_uml) { "@startuml\nAlice -> Bob: Hello\n@enduml" }

    context "when JAR is not available" do
      before do
        allow(File).to receive(:exist?)
          .with(described_class::PLANTUML_JAR_PATH).and_return(false)
      end

      it "returns error result" do
        result = described_class.generate(simple_uml)
        expect(result[:success]).to be false
        expect(result[:error])
          .to be_a(Metanorma::Plugin::Plantuml::JarNotFoundError)
      end
    end

    context "with invalid format" do
      before do
        allow(File).to receive(:exist?)
          .with(described_class::PLANTUML_JAR_PATH).and_return(true)
        allow(described_class).to receive(:java_available?).and_return(true)
      end

      it "returns error result for invalid format" do
        result = described_class.generate(simple_uml, format: :invalid)
        expect(result[:success]).to be false
        expect(result[:error])
          .to be_a(Metanorma::Plugin::Plantuml::InvalidFormatError)
      end
    end
  end

  describe ".jar_path" do
    it "returns the expected JAR path" do
      expect(described_class.jar_path).to eq(described_class::PLANTUML_JAR_PATH)
    end
  end

  describe "supported formats" do
    it "includes expected formats" do
      expect(described_class::SUPPORTED_FORMATS)
        .to include("png", "svg", "pdf", "txt", "eps")
    end
  end

  describe "version information" do
    before do
      allow(File).to receive(:exist?)
        .with(described_class::PLANTUML_JAR_PATH).and_return(true)
      allow(described_class).to receive(:java_available?).and_return(true)
    end

    context "when JAR version is available" do
      before do
        # Mock a typical PlantUML version output
        allow(Open3).to receive(:capture3).and_return(
          ["PlantUML version 1.2025.4 (Wed Jan 01 00:00:00 UTC 2025)", "",
           double(success?: true)],
        )
      end

      it "gem version uses semantic versioning" do
        gem_version = Metanorma::Plugin::Plantuml::VERSION
        expect(gem_version).to match(/^\d+\.\d+\.\d+$/)
      end

      it "can detect JAR version" do
        jar_version = described_class.version
        expect(jar_version).to eq("1.2025.4")
      end

      it "JAR version matches expected version" do
        jar_version = described_class.version
        expected_version = Metanorma::Plugin::Plantuml::PLANTUML_JAR_VERSION
        expect(jar_version).to eq(expected_version)
      end
    end

    context "when JAR version is not available" do
      before do
        allow(Open3).to receive(:capture3).and_return(
          ["", "Command failed", double(success?: false)],
        )
      end

      it "handles unavailable JAR version gracefully" do
        expect(described_class.version).to be_nil
      end
    end
  end
end
