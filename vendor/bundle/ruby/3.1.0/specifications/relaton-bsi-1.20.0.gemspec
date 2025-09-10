# -*- encoding: utf-8 -*-
# stub: relaton-bsi 1.20.0 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-bsi".freeze
  s.version = "1.20.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/metanorma/relaton-bsi", "source_code_uri" => "https://github.com/metanorma/relaton-bsi" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-12-12"
  s.description = "RelatonBsi: retrieve BSI Standards for bibliographic use using the BibliographicItem model".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/relaton-bsi".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "RelatonBsi: retrieve BSI Standards for bibliographic use using the BibliographicItem model".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<algolia>.freeze, ["~> 2.3.0".freeze])
  s.add_runtime_dependency(%q<faraday-net_http_persistent>.freeze, ["~> 2.0".freeze])
  s.add_runtime_dependency(%q<graphql>.freeze, ["~> 2.3".freeze])
  s.add_runtime_dependency(%q<graphql-client>.freeze, ["~> 0.23".freeze])
  s.add_runtime_dependency(%q<relaton-iso-bib>.freeze, ["~> 1.20.0".freeze])
end
