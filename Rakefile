require "bundler/gem_tasks"
require "rspec/core/rake_task"
require_relative "lib/metanorma/plugin/plantuml/version"

RSpec::Core::RakeTask.new(:spec)

task default: [
  "data/plantuml.jar",
  :spec,
]

def uri_open(url)
  require 'open-uri'
  URI.parse(url).open
end

file "data/plantuml.jar" do |file|
  ver = Metanorma::Plugin::Plantuml::PLANTUML_JAR_VERSION
  url = "https://github.com/plantuml/plantuml/releases/download/v#{ver}/plantuml-#{ver}.jar"
  puts "Downloading PlantUML JAR... #{url}"

  FileUtils.mkdir_p(File.dirname(file.name))

  File.open(file.name, "wb") do |f|
    f.write uri_open(url).read
  end

  puts "PlantUML JAR downloaded to #{file.name}"
end

desc "Download PlantUML JAR file"
task :download_jar => "data/plantuml.jar"

desc "Clean downloaded JAR file"
task :clean_jar do
  FileUtils.rm_f("data/plantuml.jar")
  puts "Removed data/plantuml.jar"
end
