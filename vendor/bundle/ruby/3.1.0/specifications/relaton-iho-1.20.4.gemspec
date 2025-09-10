# -*- encoding: utf-8 -*-
# stub: relaton-iho 1.20.4 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-iho".freeze
  s.version = "1.20.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.date = "2025-09-06"
  s.description = "RelatonIho: retrieve IHO Standards for bibliographic using the BibliographicItem model".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/relaton/relaton-iho".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "RelatonIho: retrieve IHO Standards for bibliographic using the BibliographicItem model".freeze

  s.installed_by_version = "3.3.27" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<base64>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<relaton-bib>.freeze, ["~> 1.20.0"])
    s.add_runtime_dependency(%q<relaton-index>.freeze, ["~> 0.2.0"])
  else
    s.add_dependency(%q<base64>.freeze, [">= 0"])
    s.add_dependency(%q<relaton-bib>.freeze, ["~> 1.20.0"])
    s.add_dependency(%q<relaton-index>.freeze, ["~> 0.2.0"])
  end
end
