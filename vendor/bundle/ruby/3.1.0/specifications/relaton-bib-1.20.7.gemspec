# -*- encoding: utf-8 -*-
# stub: relaton-bib 1.20.7 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-bib".freeze
  s.version = "1.20.7".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-03-19"
  s.description = "RelatonBib: Ruby XMLDOC impementation.".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/relaton/relaton-bib".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "RelatonBib: Ruby XMLDOC impementation.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<addressable>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<bibtex-ruby>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<htmlentities>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<iso639>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.18.3".freeze])
  s.add_runtime_dependency(%q<relaton-logger>.freeze, ["~> 0.2.0".freeze])
end
