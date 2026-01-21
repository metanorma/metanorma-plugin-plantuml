# frozen_string_literal: true

require "bundler/setup"
require "metanorma-standoc"
require "metanorma"
require "metanorma-plugin-plantuml"
require "rspec"
require "tempfile"
require "fileutils"
require "canon"

# Register lutaml blocks as first preprocessors in line in order
# to test properly with metanorma-standoc
Asciidoctor::Extensions.register do
  block_macro Metanorma::Plugin::Plantuml::ImageBlockMacroProcessor
  block Metanorma::Plugin::Plantuml::BlockProcessor
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Canon::RSpecMatchers.configure do |config|
  config.xml.match.profile = :spec_friendly
  config.xml.match.options = { attribute_order: :ignore }
end

def fixtures_path(path)
  File.join(File.expand_path("./fixtures/plantuml", __dir__), path)
end

def strip_guid(xml)
  strip_schema_version(
    xml.gsub(%r{<fetched>[^<]+</fetched>}, "<fetched/>")
      .gsub(/id="_[^"]+"/, 'id="_"'),
  )
end

def strip_schema_version(xml)
  xml.gsub(/schema-version="[^"]+"/, 'schema-version="_"')
end

ASCIIDOC_BLANK_HDR = <<~HDR
  = Document title
  Author
  :nodoc:
  :novalid:
  :no-isobib:
  :data-uri-image: false
HDR

BLANK_HDR = <<~"HDR".freeze
  <metanorma xmlns="https://www.metanorma.org/ns/standoc" version="#{Metanorma::Standoc::VERSION}" schema-version="_" type="semantic" flavor="standoc">
  <bibdata type="standard">
    <title language="en" type="main">Document title</title>
    <language>en</language>
    <script>Latn</script>
    <status>
      <stage>published</stage>
    </status>
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
      <toc-heading-levels>2</toc-heading-levels>
      <html-toc-heading-levels>2</html-toc-heading-levels>
      <doc-toc-heading-levels>2</doc-toc-heading-levels>
      <pdf-toc-heading-levels>2</pdf-toc-heading-levels>
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
