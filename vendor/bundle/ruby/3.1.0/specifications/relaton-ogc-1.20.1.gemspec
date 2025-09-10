# -*- encoding: utf-8 -*-
# stub: relaton-ogc 1.20.1 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-ogc".freeze
  s.version = "1.20.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-03-20"
  s.description = "RelatonOgc: retrieve OGC Standards for bibliographic use using the OgcBibliographicItem model".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/relaton/relaton-ogc".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "RelatonOgc: retrieve OGC Standards for bibliographic use using the OgcBibliographicItem model".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<faraday>.freeze, ["~> 2.7.0".freeze])
  s.add_runtime_dependency(%q<relaton-index>.freeze, ["~> 0.2.0".freeze])
  s.add_runtime_dependency(%q<relaton-iso-bib>.freeze, ["~> 1.20.0".freeze])
end
