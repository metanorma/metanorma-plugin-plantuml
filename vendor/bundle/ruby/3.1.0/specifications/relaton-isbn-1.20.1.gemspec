# -*- encoding: utf-8 -*-
# stub: relaton-isbn 1.20.1 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-isbn".freeze
  s.version = "1.20.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/relaton/relaton-isbn", "source_code_uri" => "https://github.com/relaton/relaton-isbn" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-04-24"
  s.description = "RelatonIsbn: retrieve publications by ISBN for bibliographic use using the BibliographicItem model".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/relaton/relaton-isbn".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.1.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "RelatonIsbn: retrieve publications by ISBN for bibliographic use using the BibliographicItem model".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<relaton-bib>.freeze, ["~> 1.20.0".freeze])
end
