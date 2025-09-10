# -*- encoding: utf-8 -*-
# stub: relaton-doi 1.20.0 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-doi".freeze
  s.version = "1.20.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/relaton/relaton-doi" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-12-13"
  s.description = "RelatonDOI: retrieve Standards for bibliographic using DOI through Crossrefand provide Relaton object.".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/relaton/relaton-doi".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "RelatonDOI: retrieve Standards for bibliographic using DOI through Crossrefand provide Relaton object.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<relaton-bib>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-bipm>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-ieee>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-ietf>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-nist>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<faraday>.freeze, ["~> 2.7".freeze])
end
