# -*- encoding: utf-8 -*-
# stub: relaton-etsi 1.20.1 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-etsi".freeze
  s.version = "1.20.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/relaton/relaton-etsi" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-06-20"
  s.description = "RelatonEtsi: retrieve ETSI Standards for bibliographic using the BibliographicItem model".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/relaton/relaton-etsi".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "RelatonEtsi: retrieve ETSI Standards for bibliographic using the BibliographicItem model".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<csv>.freeze, ["~> 3.0".freeze])
  s.add_runtime_dependency(%q<relaton-bib>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-index>.freeze, ["~> 0.2.7".freeze])
end
