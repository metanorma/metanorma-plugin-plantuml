# -*- encoding: utf-8 -*-
# stub: relaton-cen 1.20.1 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-cen".freeze
  s.version = "1.20.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/metanorma/relaton-cen", "source_code_uri" => "https://github.com/metanorma/relaton-cen" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-03-06"
  s.description = "RelatonCen: retrieve Cenelec Standards for bibliographic use using the IsoBibliographicItem model".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/relaton-cen".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "RelatonCen: retrieve Cenelec Standards for bibliographic use using the IsoBibliographicItem model".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<mechanize>.freeze, ["~> 2.10".freeze])
  s.add_runtime_dependency(%q<relaton-iso-bib>.freeze, ["~> 1.20.0".freeze])
end
