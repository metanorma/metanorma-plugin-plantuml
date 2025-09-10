# -*- encoding: utf-8 -*-
# stub: relaton-bipm 1.20.4 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-bipm".freeze
  s.version = "1.20.4".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/relaton/relaton-bipm", "source_code_uri" => "https://github.com/relaton/relaton-bipm" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-05-03"
  s.description = "RelatonBipm: retrieve BIPM Standards for bibliographic use using the BibliographicItem model".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/relaton/relaton-bipm".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "RelatonBipm: retrieve BIPM Standards for bibliographic use using the BibliographicItem model".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<faraday>.freeze, ["~> 2.7.0".freeze])
  s.add_runtime_dependency(%q<mechanize>.freeze, ["~> 2.10".freeze])
  s.add_runtime_dependency(%q<parslet>.freeze, ["~> 2.0.0".freeze])
  s.add_runtime_dependency(%q<relaton-bib>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-index>.freeze, ["~> 0.2.2".freeze])
  s.add_runtime_dependency(%q<rubyzip>.freeze, ["~> 2.3.0".freeze])
end
