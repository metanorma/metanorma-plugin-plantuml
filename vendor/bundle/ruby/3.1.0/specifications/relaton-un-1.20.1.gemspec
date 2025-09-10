# -*- encoding: utf-8 -*-
# stub: relaton-un 1.20.1 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-un".freeze
  s.version = "1.20.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/relaton/relaton-un", "source_code_uri" => "https://github.com/relaton/relaton-un" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-03-02"
  s.description = "RelatonIso: retrieve CC Standards for bibliographic use using the IsoBibliographicItem model".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/relaton/relaton-un".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "RelatonIso: retrieve CC Standards for bibliographic use using the IsoBibliographicItem model".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.8.0".freeze])
  s.add_runtime_dependency(%q<faraday>.freeze, ["~> 2.7.0".freeze])
  s.add_runtime_dependency(%q<http-cookie>.freeze, ["~> 1.0.5".freeze])
  s.add_runtime_dependency(%q<relaton-bib>.freeze, ["~> 1.20.0".freeze])
end
