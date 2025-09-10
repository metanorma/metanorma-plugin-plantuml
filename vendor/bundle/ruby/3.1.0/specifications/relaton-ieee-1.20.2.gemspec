# -*- encoding: utf-8 -*-
# stub: relaton-ieee 1.20.2 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-ieee".freeze
  s.version = "1.20.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/relaton/relaton-ieee", "source_code_uri" => "https://github.com/relaton/relaton-ieee" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-09-01"
  s.description = "RelatonIeee: retrieve IEEE Standards for bibliographic use using the IeeeBibliographicItem model".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/relaton/relaton-ieee".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.1.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "RelatonIeee: retrieve IEEE Standards for bibliographic use using the IeeeBibliographicItem model".freeze

  s.installed_by_version = "3.3.27" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<faraday>.freeze, ["~> 2.7.0"])
    s.add_runtime_dependency(%q<ieee-idams>.freeze, ["~> 0.2.14"])
    s.add_runtime_dependency(%q<mini_portile2>.freeze, ["~> 2.8.0"])
    s.add_runtime_dependency(%q<relaton-bib>.freeze, ["~> 1.20.0"])
    s.add_runtime_dependency(%q<relaton-index>.freeze, ["~> 0.2.0"])
    s.add_runtime_dependency(%q<rubyzip>.freeze, ["~> 2.3.0"])
  else
    s.add_dependency(%q<faraday>.freeze, ["~> 2.7.0"])
    s.add_dependency(%q<ieee-idams>.freeze, ["~> 0.2.14"])
    s.add_dependency(%q<mini_portile2>.freeze, ["~> 2.8.0"])
    s.add_dependency(%q<relaton-bib>.freeze, ["~> 1.20.0"])
    s.add_dependency(%q<relaton-index>.freeze, ["~> 0.2.0"])
    s.add_dependency(%q<rubyzip>.freeze, ["~> 2.3.0"])
  end
end
