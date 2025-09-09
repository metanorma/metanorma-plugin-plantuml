require "bundler/gem_tasks"
require "rspec/core/rake_task"
require_relative "lib/metanorma/plugin/plantuml/version"

RSpec::Core::RakeTask.new(:spec)

task default: [
  "data/plantuml.jar",
  :spec,
]

def uri_open(url)
  require "open-uri"
  URI.parse(url).open
end

def github_client
  require "octokit"
  @github_client ||= begin
    token = ENV['GITHUB_TOKEN'] || `gh auth token 2>/dev/null`.strip
    token = nil if token.empty?
    if token
      Octokit::Client.new(access_token: token)
    else
      Octokit::Client.new
    end
  end
end

def find_latest_valid_plantuml_release
  puts "Searching for latest valid PlantUML release..."

  client = github_client
  releases = client.releases('plantuml/plantuml')

  # Filter for valid JAR releases
  valid_releases = releases.reject(&:prerelease).select do |release|
    tag_name = release.tag_name
    version = tag_name.sub(/^v/, '')
    # Must match pattern v\d+\.\d{4}\.\d+ and not contain -native or other suffixes
    tag_name.match?(/^v\d+\.\d{4}\.\d+$/) &&
    !tag_name.include?('-native') &&
    !tag_name.include?('-snapshot') &&
    release.assets.any? { |asset| asset.name == "plantuml-#{version}.jar" }
  end

  if valid_releases.empty?
    raise "No valid PlantUML JAR releases found"
  end

  latest = valid_releases.first
  version = latest.tag_name.sub(/^v/, '')

  puts "Found latest valid release: #{latest.tag_name} (#{version})"
  {
    version: version,
    tag_name: latest.tag_name,
    html_url: latest.html_url,
    jar_asset: latest.assets.find { |asset| asset.name == "plantuml-#{version}.jar" }
  }
rescue Octokit::Error => e
  puts "GitHub API error: #{e.message}"
  raise
rescue StandardError => e
  puts "Error finding latest release: #{e.message}"
  raise
end

def current_plantuml_version
  Metanorma::Plugin::Plantuml::PLANTUML_JAR_VERSION
end

def current_gem_version
  Metanorma::Plugin::Plantuml::VERSION
end

def update_version_file(new_plantuml_version, new_gem_version)
  version_file = "lib/metanorma/plugin/plantuml/version.rb"
  content = File.read(version_file)

  # Update PlantUML version (handle .freeze suffix)
  original_content = content.dup
  content.gsub!(/VERSION = ["']([^"']+)["']\.freeze/, %Q(VERSION = "#{new_gem_version}".freeze))
  content.gsub!(/PLANTUML_JAR_VERSION = ["']([^"']+)["']\.freeze/, %Q(PLANTUML_JAR_VERSION = "#{new_plantuml_version}".freeze))

  if content == original_content
    puts "⚠️  No changes made to version file. Current content:"
    puts content
    raise "Failed to update version file - no substitutions made"
  end

  File.write(version_file, content)

  # Verify the file was written correctly
  updated_content = File.read(version_file)
  unless updated_content.include?(%Q("#{new_plantuml_version}")) && updated_content.include?(%Q("#{new_gem_version}"))
    puts "❌ File content after update:"
    puts updated_content
    raise "Version file update verification failed"
  end

  puts "✅ Updated version file:"
  puts "  PlantUML: #{new_plantuml_version}"
  puts "  Gem: #{new_gem_version}"
end

def increment_gem_version(current_version)
  require 'rubygems'
  version = Gem::Version.new(current_version)
  segments = version.segments.dup
  segments[2] = (segments[2] || 0) + 1
  segments.join('.')
end

def test_plantuml_jar
  jar_file = "data/plantuml.jar"

  unless File.exist?(jar_file)
    raise "PlantUML JAR file not found: #{jar_file}"
  end

  puts "Testing PlantUML JAR functionality..."

  # Test version command
  version_output = `java -jar #{jar_file} -version 2>&1`
  unless $?.success? && version_output.include?("PlantUML")
    raise "PlantUML version test failed. Output: #{version_output}"
  end
  puts "✅ Version test passed"

  # Test diagram generation
  test_diagram = "test_diagram_#{Time.now.to_i}.puml"
  test_svg = test_diagram.sub('.puml', '.svg')

  File.write(test_diagram, <<~PUML)
    @startuml
    Alice -> Bob: Hello
    Bob -> Alice: Hi
    @enduml
  PUML

  begin
    generation_output = `java -jar #{jar_file} -tsvg #{test_diagram} 2>&1`
    unless $?.success? && File.exist?(test_svg)
      raise "PlantUML diagram generation test failed. Output: #{generation_output}"
    end
    puts "✅ Diagram generation test passed"
  ensure
    FileUtils.rm_f([test_diagram, test_svg])
  end
end

file "data/plantuml.jar" do |file|
  # Read version directly from file to avoid constant redefinition warnings
  version_content = File.read("lib/metanorma/plugin/plantuml/version.rb")
  ver = version_content.match(/PLANTUML_JAR_VERSION = ["']([^"']+)["']/)[1]
  url = "https://github.com/plantuml/plantuml/releases/download/v#{ver}/plantuml-#{ver}.jar"
  puts "Downloading PlantUML JAR... #{url}"

  FileUtils.mkdir_p(File.dirname(file.name))

  File.open(file.name, "wb") do |f|
    f.write uri_open(url).read
  end

  puts "PlantUML JAR downloaded to #{file.name}"
end

desc "Download PlantUML JAR file"
task download_jar: "data/plantuml.jar"

desc "Clean downloaded JAR file"
task :clean_jar do
  FileUtils.rm_f("data/plantuml.jar")
  puts "Removed data/plantuml.jar"
end

desc "Find latest valid PlantUML release"
task :find_latest_plantuml do
  release_info = find_latest_valid_plantuml_release
  puts "Latest PlantUML version: #{release_info[:version]}"
  puts "Release URL: #{release_info[:html_url]}"
  puts "JAR asset: #{release_info[:jar_asset].name}" if release_info[:jar_asset]
end

desc "Check current PlantUML version"
task :check_plantuml_version do
  puts "Current PlantUML version: #{current_plantuml_version}"
  puts "Current gem version: #{current_gem_version}"
end

desc "Test PlantUML JAR functionality"
task :test_plantuml do
  test_plantuml_jar
end

desc "Update PlantUML to latest version"
task :update_plantuml do
  puts "Checking for PlantUML updates..."

  current_version = current_plantuml_version
  current_gem = current_gem_version

  begin
    release_info = find_latest_valid_plantuml_release
    latest_version = release_info[:version]

    puts "Current version: #{current_version}"
    puts "Latest version: #{latest_version}"

    if current_version == latest_version
      puts "✅ PlantUML is already up to date"
      exit 0
    end

    # Check if update is actually newer
    require 'rubygems'
    if Gem::Version.new(latest_version) <= Gem::Version.new(current_version)
      puts "⚠️  Latest version (#{latest_version}) is not newer than current (#{current_version})"
      exit 0
    end

    puts "🔄 Updating PlantUML from #{current_version} to #{latest_version}"

    # Update version files
    new_gem_version = increment_gem_version(current_gem)
    update_version_file(latest_version, new_gem_version)

    # Clean old JAR and download new one
    Rake::Task[:clean_jar].invoke
    Rake::Task[:download_jar].invoke

    # Test new JAR
    test_plantuml_jar

    puts "🎉 Successfully updated PlantUML!"
    puts "  PlantUML: #{current_version} → #{latest_version}"
    puts "  Gem: #{current_gem} → #{new_gem_version}"
    puts "  Release: #{release_info[:html_url]}"

    exit 1  # Exit with code 1 to indicate changes were made

  rescue StandardError => e
    puts "❌ Failed to update PlantUML: #{e.message}"
    exit 2  # Exit with code 2 to indicate error
  end
end

desc "Update PlantUML version in version.rb (manual)"
task :update_plantuml_version, [:plantuml_version] do |t, args|
  plantuml_version = args[:plantuml_version]

  unless plantuml_version
    puts "Usage: rake update_plantuml_version[1.2025.7]"
    exit 1
  end

  unless plantuml_version.match?(/^\d+\.\d{4}\.\d+$/)
    puts "Invalid version format. Expected: N.YYYY.NNN (e.g., 1.2025.7)"
    exit 1
  end

  current_gem = current_gem_version
  new_gem_version = increment_gem_version(current_gem)

  update_version_file(plantuml_version, new_gem_version)

  puts "Updated versions:"
  puts "  PlantUML: #{plantuml_version}"
  puts "  Gem: #{new_gem_version}"
  puts ""
  puts "Don't forget to run: rake clean_jar download_jar"
end
