require "spec_helper"

RSpec.describe Metanorma::Plugin::Plantuml do
  def metanorma_convert(input)
    result = Asciidoctor.convert(
      input,
      backend: :standoc, header_footer: true,
      agree_to_terms: true, to_file: false, safe: :safe,
      attributes: ["nodoc", "stem", "xrefstyle=short",
                   "docfile=test.adoc",
                   "output_dir="]
    )
    strip_guid(result)
  end

  context "PlantUML integration tests" do
    before do
      # Skip all tests if PlantUML is not available
      skip "PlantUML not available" unless Metanorma::Plugin::Plantuml::Wrapper.available?
    end

    context "Basic PlantUML processing" do
      let(:input) do
        <<~TEXT
          #{ASCIIDOC_BLANK_HDR}
          :imagesdir: spec/assets

          plantuml_image::spec/fixtures/plantuml/plantuml-lrg-25-10-1.puml[includedirs=spec/fixtures/plantuml_test_include_path]
        TEXT
      end

      it "correctly renders PlantUML diagrams" do
        result = metanorma_convert(input)

        expected = <<~XML
          #{BLANK_HDR}
          <sections>
            <figure id="_">
              <image src="../../_plantuml_images/_.png" filename="../../_plantuml_images/_.png" id="_" mimetype="image/png" height="auto" width="auto"/>
            </figure>
          </sections>
          </metanorma>
        XML

        expect(strip_guid(result.gsub(%r{_plantuml_images/plantuml[^./]+\.},
                                      "_plantuml_images/_.")))
          .to be_xml_equivalent_to(expected)
      end
    end

    context "Basic PlantUML processing with file in includedirs" do
      let(:input) do
        <<~TEXT
          #{ASCIIDOC_BLANK_HDR}
          :imagesdir: spec/assets

          plantuml_image::spec/fixtures/plantuml/plantuml-lrg-25-10-1-include.puml[includedirs=spec/fixtures/plantuml/test_include_path]
        TEXT
      end

      it "correctly renders PlantUML diagrams" do
        result = metanorma_convert(input)

        expected = <<~XML
          #{BLANK_HDR}
          <sections>
            <figure id="_">
              <image src="../../_plantuml_images/_.png" filename="../../_plantuml_images/_.png" id="_" mimetype="image/png" height="auto" width="auto"/>
            </figure>
          </sections>
          </metanorma>
        XML

        expect(strip_guid(result.gsub(%r{_plantuml_images/plantuml[^./]+\.},
                                      "_plantuml_images/_.")))
          .to be_xml_equivalent_to(expected)
      end
    end

    context "PlantUML with format specification" do
      let(:input) do
        <<~TEXT
          #{ASCIIDOC_BLANK_HDR}
          :imagesdir: spec/assets
          :plantuml-image-format: svg

          plantuml_image::spec/fixtures/plantuml/plantuml-lrg-1-12-simple.puml[]
        TEXT
      end

      it "correctly renders SVG PlantUML diagrams" do
        result = metanorma_convert(input)

        expected = <<~XML
          #{BLANK_HDR}
          <sections>
            <figure id="_">
              <image src="../../_plantuml_images/_.svg" filename="../../_plantuml_images/_.svg" id="_" mimetype="image/svg+xml" height="auto" width="auto"/>
            </figure>
          </sections>
          </metanorma>
        XML

        expect(strip_guid(result.gsub(%r{_plantuml_images/plantuml[^./]+\.},
                                      "_plantuml_images/_.")))
          .to be_xml_equivalent_to(expected)
      end
    end

    context "PlantUML with imagesdir" do
      let(:input) do
        <<~TEXT
          #{ASCIIDOC_BLANK_HDR}
          :imagesdir: spec/assets
          :data-uri-image: false

          plantuml_image::spec/fixtures/plantuml/plantuml-lrg-1-12-simple.puml[]
        TEXT
      end

      it "correctly renders PlantUML diagrams with imagesdir" do
        result = metanorma_convert(input)

        expected = <<~XML
          #{BLANK_HDR}
          <sections>
            <figure id="_">
              <image src="../../_plantuml_images/_.png" filename="../../_plantuml_images/_.png" id="_" mimetype="image/png" height="auto" width="auto"/>
            </figure>
          </sections>
          </metanorma>
        XML

        expect(strip_guid(result.gsub(%r{plantuml[^./]+\.png}, "_.png")))
          .to be_xml_equivalent_to(expected)
      end
    end

    context "Multiple PlantUML diagrams with included files" do
      let(:input) do
        <<~TEXT
          #{ASCIIDOC_BLANK_HDR}
          :imagesdir: spec/assets
          :plantuml-includedirs: spec/fixtures/plantuml

          plantuml_image::spec/fixtures/plantuml/plantuml-lrg-25-10-1-include.puml[includedirs=spec/fixtures/plantuml/test_include_path]

          plantuml_image::spec/fixtures/plantuml/plantuml-lrg-25-10-2.puml[]
        TEXT
      end

      it "processes multiple diagrams correctly" do
        result = metanorma_convert(input)

        expected = <<~XML
          #{BLANK_HDR}
          <sections>
            <figure id="_">
              <image src="../../_plantuml_images/_.png" filename="../../_plantuml_images/_.png" id="_" mimetype="image/png" height="auto" width="auto"/>
            </figure>
            <figure id="_">
              <image src="../../_plantuml_images/_.png" filename="../../_plantuml_images/_.png" id="_" mimetype="image/png" height="auto" width="auto"/>
            </figure>
          </sections>
          </metanorma>
        XML

        expect(strip_guid(result.gsub(%r{_plantuml_images/plantuml[^./]+\.},
                                      "_plantuml_images/_.")))
          .to be_xml_equivalent_to(expected)
      end
    end
  end

  context "PlantUML error handling" do
    context "PlantUML with mismatched delimiters" do
      let(:input) do
        <<~TEXT
          #{ASCIIDOC_BLANK_HDR}

          plantuml_image::spec/fixtures/plantuml/plantuml-lrg-1-12-invalid.puml[]
        TEXT
      end

      it "falls back to source code block with syntax errors" do
        expect do
          metanorma_convert(input)
        end
          .to output(%r{@startuml without matching @enduml in PlantUML!})
          .to_stderr

        result = metanorma_convert(input)

        expected = <<~XML
          #{BLANK_HDR}
          <sections>
            <sourcecode id="_" lang="plantuml"><body>spec/fixtures/plantuml/plantuml-lrg-1-12-invalid.puml</sourcecode>
          </sections>
          </metanorma>
        XML

        expect(strip_guid(result)).to be_xml_equivalent_to(expected)
      end
    end

    context "when PlantUML wrapper is unavailable" do
      let(:input) do
        <<~TEXT
          #{ASCIIDOC_BLANK_HDR}

          plantuml_image::spec/fixtures/plantuml/plantuml-lrg-1-12-simple.puml[]
        TEXT
      end

      it "falls back to source code block when PlantUML is disabled" do
        # Use document attribute to disable PlantUML processing
        input_with_disabled = input.sub(/:no-isobib:/,
                                        ":no-isobib:\n:plantuml-disabled:")

        result = metanorma_convert(input_with_disabled)

        expected = <<~XML
          #{BLANK_HDR}
          <sections>
            <sourcecode id="_" lang="plantuml"><body>spec/fixtures/plantuml/plantuml-lrg-1-12-simple.puml</body></sourcecode>
          </sections>
          </metanorma>
        XML

        expect(strip_guid(result)).to be_xml_equivalent_to(expected)
      end
    end
  end
end
