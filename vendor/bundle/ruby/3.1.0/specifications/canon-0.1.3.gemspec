# -*- encoding: utf-8 -*-
# stub: canon 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "canon".freeze
  s.version = "0.1.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/metanorma/canon", "homepage_uri" => "https://github.com/metanorma/canon", "source_code_uri" => "https://github.com/metanorma/canon" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-08-24"
  s.description = "Library for canonicalizing and pretty-printing XML, YAML, and JSON with RSpec matchers for equivalence testing".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/canon".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Library for canonicalization of serialization formats".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<compare-xml>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<diffy>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<json>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rubocop-performance>.freeze, [">= 0".freeze])
end
