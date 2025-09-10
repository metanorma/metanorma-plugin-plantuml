# -*- encoding: utf-8 -*-
# stub: relaton-oasis 1.20.0 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-oasis".freeze
  s.version = "1.20.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/metanorma/relaton-oasis", "source_code_uri" => "https://github.com/metanorma/relaton-oasis" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-12-13"
  s.description = "RelatonOasis: retrieve OASIS Standards for bibliographic use using the BibliographicItem model".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/relaton-oasis".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "RelatonOasis: retrieve OASIS Standards for bibliographic use using the BibliographicItem model".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<mechanize>.freeze, ["~> 2.10".freeze])
  s.add_runtime_dependency(%q<multi_json>.freeze, ["~> 1.15.0".freeze])
  s.add_runtime_dependency(%q<relaton-bib>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-index>.freeze, ["~> 0.2.0".freeze])
end
