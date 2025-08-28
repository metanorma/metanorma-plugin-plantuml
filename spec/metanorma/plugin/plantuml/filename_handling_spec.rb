require "spec_helper"

RSpec.describe "PlantUML Filename Handling" do
  let(:temp_dir) { Dir.mktmpdir }

  after do
    FileUtils.rm_rf(temp_dir) if Dir.exist?(temp_dir)
  end

  # Simple test document and parent objects
  class TestDocument
    attr_reader :attributes

    def initialize(temp_dir, attrs = {})
      @attributes = {
        "docdir" => temp_dir,
        "imagesdir" => "images",
        "plantuml-image-format" => "png"
      }.merge(attrs)
    end

    def attr(key)
      @attributes[key]
    end
  end

  class TestParent
    attr_reader :document

    def initialize(document)
      @document = document
    end
  end

  class TestReader
    attr_reader :source, :lines

    def initialize(source)
      @source = source
      @lines = [source]
    end
  end

  let(:test_document) { TestDocument.new(temp_dir) }
  let(:test_parent) { TestParent.new(test_document) }

  describe "filename extraction from PlantUML content" do
    it "extracts filename from @startuml with simple name" do
      content = "@startuml PERT\nAlice -> Bob\n@enduml"
      filename = Metanorma::Plugin::Plantuml::Backend.send(:extract_plantuml_filename, content)
      expect(filename).to eq("PERT")
    end

    it "extracts and sanitizes filename from quoted name with spaces" do
      content = "@startebnf \"My Number\"\nPDF_IntegerObject = \"1-9\";\n@endebnf"
      filename = Metanorma::Plugin::Plantuml::Backend.send(:extract_plantuml_filename, content)
      expect(filename).to eq("My_Number")
    end

    it "sanitizes dangerous path traversal attempts" do
      content = "@startuml \"../../../danger\"\nAlice -> Bob\n@enduml"
      filename = Metanorma::Plugin::Plantuml::Backend.send(:extract_plantuml_filename, content)
      expect(filename).to eq("danger")  # Sanitization removes path traversal
    end

    it "handles different diagram types" do
      test_cases = [
        { content: "@startjson\n{\"key\": \"value\"}\n@endjson", expected: nil },
        { content: "@startyaml\nkey: value\n@endyaml", expected: nil },
        { content: "@startsalt\n{Hello}\n@endsalt", expected: nil },
        { content: "@startgantt\n[Task] requires 5 days\n@endgantt", expected: nil },
        { content: "@startjson filename\n{\"key\": \"value\"}\n@endjson", expected: "filename" },
        { content: "@startyaml \"my yaml\"\nkey: value\n@endyaml", expected: "my_yaml" }
      ]

      test_cases.each do |test_case|
        filename = Metanorma::Plugin::Plantuml::Backend.send(:extract_plantuml_filename, test_case[:content])
        expect(filename).to eq(test_case[:expected])
      end
    end
  end

  describe "integration with real fixture files" do
    before do
      skip "PlantUML not available" unless Metanorma::Plugin::Plantuml::Wrapper.available?
    end

    it "processes plantuml-lrg-4-7.wsd with filename PERT" do
      fixture_content = File.read(fixtures_path('plantuml-lrg-4-7.wsd'))
      reader = TestReader.new(fixture_content)

      result = Metanorma::Plugin::Plantuml::Backend.generate_file(test_parent, reader)

      expect(result).to match(/_plantuml_images\/PERT\.png/)
    end

    it "processes plantuml-custom-filename.wsd with quoted filename" do
      fixture_content = File.read(fixtures_path('plantuml-custom-filename.wsd'))
      reader = TestReader.new(fixture_content)

      result = Metanorma::Plugin::Plantuml::Backend.generate_file(test_parent, reader)

      expect(result).to match(/_plantuml_images\/My_Number\.png/)
    end
  end

  describe "security validation" do
    it "prevents path traversal in filenames" do
      dangerous_filenames = [
        "../../../etc/passwd",
        "/tmp/dangerous_overwrite",
        "\\Windows\\System32\\config",
        "../../important/file"
      ]

      dangerous_filenames.each do |dangerous_name|
        sanitized = Metanorma::Plugin::Plantuml::Backend.send(:sanitize_filename, dangerous_name)

        # Should not contain path separators
        expect(sanitized).not_to include("/")
        expect(sanitized).not_to include("\\")
        expect(sanitized).not_to include("..")

        # Should be a safe filename
        expect(sanitized).to match(/^[a-zA-Z0-9_\-\.]+$/)
      end
    end

    it "preserves safe filenames" do
      safe_filenames = [
        "PERT",
        "My_Diagram",
        "test-file",
        "diagram.backup"
      ]

      safe_filenames.each do |safe_name|
        sanitized = Metanorma::Plugin::Plantuml::Backend.send(:sanitize_filename, safe_name)
        expect(sanitized).to eq(safe_name)
      end
    end
  end
end
