# -*- encoding: utf-8 -*-
# stub: glossarist 2.3.11 ruby lib

Gem::Specification.new do |s|
  s.name = "glossarist".freeze
  s.version = "2.3.11".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/glossarist/glossarist-ruby/issues", "homepage_uri" => "https://github.com/glossarist/glossarist-ruby", "source_code_uri" => "https://github.com/glossarist/glossarist-ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-07-25"
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["glossarist".freeze]
  s.files = ["exe/glossarist".freeze]
  s.homepage = "https://github.com/glossarist/glossarist-ruby".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Concept models for terminology glossaries conforming ISO 10241-1.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<lutaml-model>.freeze, ["~> 0.7".freeze])
  s.add_runtime_dependency(%q<relaton>.freeze, ["~> 1.19".freeze])
  s.add_runtime_dependency(%q<thor>.freeze, [">= 0".freeze])
end
