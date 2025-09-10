# -*- encoding: utf-8 -*-
# stub: relaton-gb 1.20.1 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-gb".freeze
  s.version = "1.20.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-04-24"
  s.description = "RelatonGb: retrieve Chinese GB Standards for bibliographic use using the BibliographicItem model.".freeze
  s.email = ["pen.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/relaton_gb".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "RelatonGb: retrieve Chinese GB Standards for bibliographic use using the BibliographicItem model.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<cnccs>.freeze, ["~> 0.1.1".freeze])
  s.add_runtime_dependency(%q<connection_pool>.freeze, ["~> 2.4.0".freeze])
  s.add_runtime_dependency(%q<gb-agencies>.freeze, ["~> 0.0.1".freeze])
  s.add_runtime_dependency(%q<mechanize>.freeze, ["~> 2.10".freeze])
  s.add_runtime_dependency(%q<relaton-iso-bib>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<csv>.freeze, ["~> 3.0".freeze])
end
