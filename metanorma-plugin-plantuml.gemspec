# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "metanorma/plugin/plantuml/version"

Gem::Specification.new do |spec|
  spec.name          = "metanorma-plugin-plantuml"
  spec.version       = Metanorma::Plugin::Plantuml::VERSION
  spec.authors       = ["Ribose Inc."]
  spec.email         = ["open.source@ribose.com"]

  spec.summary       = "Metanorma plugin for PlantUML"
  spec.description   = "Metanorma plugin for PlantUML"

  spec.homepage      = "https://github.com/metanorma/metanorma-plugin-plantuml"
  spec.license       = "BSD-2-Clause"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been
  # added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end + ["data/plantuml.jar"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.7.0"

  spec.add_dependency "asciidoctor"
  spec.add_dependency "isodoc"

  spec.metadata["rubygems_mfa_required"] = "false"
end
