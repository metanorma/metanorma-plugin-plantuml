require "bundler/setup"
require "metanorma-standoc"
require "metanorma"
require "metanorma-plugin-plantuml"
require "rspec"
require "tempfile"
require "fileutils"
require "canon"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def fixtures_path(path)
  File.join(File.expand_path("./fixtures/plantuml", __dir__), path)
end

def strip_guid(xml)
  strip_schema_version(
    xml.gsub(%r{<fetched>[^<]+</fetched>}, "<fetched/>")
      .gsub(%r{id="_[^"]+"}, 'id="_"'),
  )
end

def strip_schema_version(xml)
  xml.gsub(%r{schema-version="[^"]+"}, 'schema-version="_"')
end

# TODO: Read this from metanorma-standoc's spec_helper!
ASCIIDOC_BLANK_HDR = <<~HDR.freeze
  = Document title
  Author
  :nodoc:
  :novalid:
  :no-isobib:
  :data-uri-image: false
HDR

# TODO: Read this from metanorma-standoc's spec_helper!
BLANK_HDR = <<~"HDR".freeze
  <metanorma xmlns="https://www.metanorma.org/ns/standoc" version="#{Metanorma::Standoc::VERSION}" schema-version="_" type="semantic" flavor="standoc">
  <bibdata type="standard">
  <title language="en" format="text/plain">Document title</title>
    <language>en</language>
    <script>Latn</script>
    <status><stage>published</stage></status>
    <copyright>
      <from>#{Time.new.year}</from>
    </copyright>
    <ext>
    <doctype>standard</doctype>
    <flavor>standoc</flavor>
    </ext>
  </bibdata>
    <metanorma-extension>
       <semantic-metadata>
      <stage-published>true</stage-published>
     </semantic-metadata>
    <presentation-metadata>
      <name>TOC Heading Levels</name>
      <value>2</value>
    </presentation-metadata>
    <presentation-metadata>
      <name>HTML TOC Heading Levels</name>
      <value>2</value>
    </presentation-metadata>
    <presentation-metadata>
      <name>DOC TOC Heading Levels</name>
      <value>2</value>
    </presentation-metadata>
    <presentation-metadata>
      <name>PDF TOC Heading Levels</name>
      <value>2</value>
    </presentation-metadata>
  </metanorma-extension>
HDR

class TestDocument
  attr_reader :attributes

  def initialize(temp_dir, attrs = {})
    @attributes = {
      "docdir" => temp_dir,
      "imagesdir" => "images",
      "plantuml-image-format" => "png",
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

# Test implementation that captures method calls
class TestBlockProcessor < Metanorma::Plugin::Plantuml::BlockProcessor
  attr_reader :warnings, :created_blocks

  def initialize
    super
    @warnings = []
    @created_blocks = []
  end

  def warn(message)
    @warnings << message
  end

  def create_image_block(parent, attrs)
    @created_blocks << { type: :image, parent: parent, attrs: attrs }
    "image_block_result"
  end

  def create_listing_block(parent, content, attrs)
    @created_blocks << {
      type: :listing,
      parent: parent,
      content: content,
      attrs: attrs,
    }
    "listing_block_result"
  end
end
