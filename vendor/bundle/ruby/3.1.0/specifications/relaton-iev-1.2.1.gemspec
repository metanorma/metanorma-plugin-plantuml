# -*- encoding: utf-8 -*-
# stub: relaton-iev 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-iev".freeze
  s.version = "1.2.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-05-08"
  s.description = "RelatonIev: manipulates IEV references to IEC 60050.".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/relaton-iev".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "RelatonIev: manipulates IEV references to IEC 60050.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<equivalent-xml>.freeze, ["~> 0.6".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<vcr>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<webmock>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<htmlentities>.freeze, ["~> 4.3.4".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.13.0".freeze])
  s.add_runtime_dependency(%q<relaton>.freeze, [">= 1.15".freeze])
  s.add_runtime_dependency(%q<uuidtools>.freeze, [">= 0".freeze])
end
