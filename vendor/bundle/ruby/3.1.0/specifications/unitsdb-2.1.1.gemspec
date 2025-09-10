# -*- encoding: utf-8 -*-
# stub: unitsdb 2.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "unitsdb".freeze
  s.version = "2.1.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/unitsml/unitsdb-ruby/releases", "homepage_uri" => "https://github.com/unitsml/unitsdb-ruby", "source_code_uri" => "https://github.com/unitsml/unitsdb-ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-07-11"
  s.description = "Library to handle UnitsDB content.".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["unitsdb".freeze]
  s.files = ["exe/unitsdb".freeze]
  s.homepage = "https://github.com/unitsml/unitsdb-ruby".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Ruby library for UnitsDB".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<lutaml-model>.freeze, ["~> 0.7".freeze])
  s.add_runtime_dependency(%q<rdf>.freeze, ["~> 3.1".freeze])
  s.add_runtime_dependency(%q<rdf-turtle>.freeze, ["~> 3.1".freeze])
  s.add_runtime_dependency(%q<rubyzip>.freeze, ["~> 2.3".freeze])
  s.add_runtime_dependency(%q<terminal-table>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<thor>.freeze, ["~> 1.0".freeze])
end
