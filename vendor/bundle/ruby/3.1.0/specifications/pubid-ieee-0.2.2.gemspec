# -*- encoding: utf-8 -*-
# stub: pubid-ieee 0.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "pubid-ieee".freeze
  s.version = "0.2.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-02-01"
  s.description = "Library to generate, parse and manipulate IEEE PubID.".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.extra_rdoc_files = ["README.adoc".freeze, "LICENSE.txt".freeze]
  s.files = ["LICENSE.txt".freeze, "README.adoc".freeze]
  s.homepage = "https://github.com/metanorma/pubid-ieee".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Library to generate, parse and manipulate IEEE PubID.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0".freeze])
  s.add_runtime_dependency(%q<parslet>.freeze, ["~> 2.0.0".freeze])
  s.add_runtime_dependency(%q<pubid-iso>.freeze, ["~> 0.7".freeze])
end
