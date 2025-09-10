# -*- encoding: utf-8 -*-
# stub: relaton-iec 1.20.0 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-iec".freeze
  s.version = "1.20.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-12-12"
  s.description = "RelatonIec: retrieve IEC Standards for bibliographic use using the IecBibliographicItem model".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/relaton/relaton-iec".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "RelatonIec: retrieve IEC Standards for bibliographic use using the IecBibliographicItem model".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<addressable>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<base64>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<relaton-index>.freeze, ["~> 0.2.0".freeze])
  s.add_runtime_dependency(%q<relaton-iso-bib>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<rubyzip>.freeze, [">= 0".freeze])
end
