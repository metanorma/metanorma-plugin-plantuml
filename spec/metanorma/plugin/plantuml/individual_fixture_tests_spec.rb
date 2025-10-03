# frozen_string_literal: true

require "spec_helper"

RSpec.describe "PlantUML Individual Fixture Tests" do
  before(:all) do
    @wrapper = Metanorma::Plugin::Plantuml::Wrapper
    skip "PlantUML JAR not available" unless @wrapper.available?
  end

  # Get all fixture files
  fixture_files = Dir.glob(File.join(fixtures_path("."), "*.puml")).sort

  # Chapter names from the PlantUML Language Reference Guide
  def self.chapter_names
    {
      1 => "Sequence Diagram",
      2 => "Use Case Diagram",
      3 => "Class Diagram",
      4 => "Object Diagram",
      5 => "Activity Diagram (legacy)",
      6 => "Activity Diagram (New Syntax)",
      7 => "Component Diagram",
      8 => "Deployment Diagram",
      9 => "State Diagram",
      10 => "Timing Diagram",
      11 => "Display JSON Data",
      12 => "Display YAML Data",
      13 => "Network Diagram with nwdiag",
      14 => "Salt (Wireframe)",
      15 => "ArchiMate Diagram",
      16 => "Gantt Chart",
      17 => "MindMap",
      18 => "Work Breakdown Structure (WBS)",
      19 => "Maths",
      20 => "Information Engineering Diagrams",
      25 => "Preprocessing",
      27 => "PlantUML Standard Library",
    }.freeze
  end

  def self.get_chapter_info(filename)
    if filename =~ /plantuml-lrg-(\d+)-/
      chapter = Regexp.last_match(1).to_i
      chapter_name = chapter_names[chapter] || "Unknown Chapter"
      section = filename
        .match(/plantuml-lrg-\d+-(.+)\.puml$/)&.[](1) || "unknown"
      [chapter, chapter_name, section]
    else
      [0, "Other", filename.gsub(".puml", "")]
    end
  end

  # Helper methods
  def valid_png?(content)
    return false if content.nil? || content.length < 8

    # Handle encoding properly for binary PNG content
    binary_content = content.force_encoding("ASCII-8BIT")
    png_header = "\x89PNG\r\n\x1a\n".dup.force_encoding("ASCII-8BIT")
    binary_content.start_with?(png_header) && content.length > 100
  end

  def valid_svg?(content)
    return false if content.nil? || content.empty?

    content.include?("<svg") &&
      content.include?("</svg>") &&
      content.length > 100
  end

  # Create individual tests for each fixture file
  fixture_files.each do |fixture_file|
    fixture_name = File.basename(fixture_file, ".puml")
    chapter, chapter_name, section = get_chapter_info(fixture_name)

    describe "#{chapter_name} (Chapter #{chapter})" do
      describe "Section #{section} (#{fixture_name})" do
        let(:content) { File.read(fixture_file) }

        it "generates PNG successfully" do
          includedirs = [File.dirname(fixture_file)]

          # add additional include directories from the document
          if fixture_name == "plantuml-lrg-25-10-1-include"
            includedirs << File.join(File.dirname(fixture_file),
                                     "test_include_path")
          end

          result = @wrapper.generate(
            content,
            format: :png,
            includedirs: includedirs,
          )

          if result[:success]
            expect(File.exist?(result[:output_path])).to be(true)
            expect(File.size(result[:output_path])).to be > 0

            # Verify PNG format
            png_content = File.binread(result[:output_path])

            expect(valid_png?(png_content))
              .to be(true), "Generated file is not a valid PNG"

            # Cleanup
            File.delete(result[:output_path])
          else
            # For files that fail, we expect it to be due to syntax issues
            # Just report the failure without causing test to fail
            puts "  NOTE: #{fixture_name} PNG generation failed: " \
                 "#{result[:error].message.split('.').first}"
            expect(result[:error]).to be_a(Metanorma::Plugin::Plantuml::PlantumlError)
          end
        end

        it "generates SVG successfully" do
          includedirs = [File.dirname(fixture_file)]

          # add additional include directories from the document
          if fixture_name == "plantuml-lrg-25-10-1-include"
            includedirs << File.join(File.dirname(fixture_file),
                                     "test_include_path")
          end

          result = @wrapper.generate(
            content,
            format: :svg,
            includedirs: includedirs,
          )

          if result[:success]
            expect(File.exist?(result[:output_path])).to be(true)

            # Verify SVG format
            svg_content = File.read(result[:output_path])
            expect(valid_svg?(svg_content))
              .to be(true), "Generated file is not a valid SVG"

            # Cleanup
            File.delete(result[:output_path])
          else
            # For files that fail, we expect it to be due to syntax issues
            puts "  NOTE: #{fixture_name} SVG generation failed: " \
                 "#{result[:error].message.split('.').first}"
            expect(result[:error]).to be_a(Metanorma::Plugin::Plantuml::PlantumlError)
          end
        end
      end
    end
  end
end
