# frozen_string_literal: true

require "spec_helper"

RSpec.describe Metanorma::Plugin::Plantuml::PlantumlError do
  it "is a StandardError" do
    expect(described_class).to be < StandardError
  end

  it "accepts a message" do
    error = described_class.new("test message")
    expect(error.message).to eq("test message")
  end

  it "exposes original_error" do
    original = StandardError.new("root cause")
    error = described_class.new("wrapped", original)
    expect(error.original_error).to eq(original)
  end
end

RSpec.describe Metanorma::Plugin::Plantuml::GenerationError do
  it "is a PlantumlError" do
    expect(described_class).to be < Metanorma::Plugin::Plantuml::PlantumlError
  end

  it "prefixes message with 'PlantUML generation failed'" do
    error = described_class.new("something broke")
    expect(error.message).to eq("PlantUML generation failed: something broke")
  end
end

RSpec.describe Metanorma::Plugin::Plantuml::JarNotFoundError do
  it "is a PlantumlError" do
    expect(described_class).to be < Metanorma::Plugin::Plantuml::PlantumlError
  end

  it "includes JAR path in message" do
    error = described_class.new("/path/to/plantuml.jar")
    expect(error.message).to include("/path/to/plantuml.jar")
  end

  it "provides generic message without path" do
    error = described_class.new
    expect(error.message).to eq("PlantUML JAR file not found")
  end
end

RSpec.describe Metanorma::Plugin::Plantuml::JavaNotFoundError do
  it "is a PlantumlError" do
    expect(described_class).to be < Metanorma::Plugin::Plantuml::PlantumlError
  end

  it "provides installation guidance in message" do
    error = described_class.new
    expect(error.message).to include("Java runtime not found")
    expect(error.message).to include("PATH")
  end
end

RSpec.describe Metanorma::Plugin::Plantuml::InvalidFormatError do
  it "is a PlantumlError" do
    expect(described_class).to be < Metanorma::Plugin::Plantuml::PlantumlError
  end

  it "includes the invalid format and available formats" do
    error = described_class.new("bmp", %w[png svg pdf])
    expect(error.message).to include("bmp")
    expect(error.message).to include("png, svg, pdf")
  end
end
