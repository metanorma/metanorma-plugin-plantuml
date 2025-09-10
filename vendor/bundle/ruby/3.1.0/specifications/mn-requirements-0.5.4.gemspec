# -*- encoding: utf-8 -*-
# stub: mn-requirements 0.5.4 ruby lib

Gem::Specification.new do |s|
  s.name = "mn-requirements".freeze
  s.version = "0.5.4".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-06-30"
  s.description = "Requirements processing and rendering according to different models\n".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/mn-requirements".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Requirements processing and rendering according to different models".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<isodoc-i18n>.freeze, [">= 1.1.0".freeze])
  s.add_runtime_dependency(%q<metanorma-utils>.freeze, [">= 0.10.0".freeze])
  s.add_runtime_dependency(%q<relaton-render>.freeze, [">= 0.9.0".freeze])
  s.add_development_dependency(%q<debug>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<equivalent-xml>.freeze, ["~> 0.6".freeze])
  s.add_development_dependency(%q<guard>.freeze, ["~> 2.14".freeze])
  s.add_development_dependency(%q<guard-rspec>.freeze, ["~> 4.7".freeze])
  s.add_development_dependency(%q<metanorma-standoc>.freeze, [">= 2.8.0".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1".freeze])
  s.add_development_dependency(%q<rubocop-performance>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<sassc-embedded>.freeze, ["~> 1".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.15".freeze])
  s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9".freeze])
  s.add_development_dependency(%q<xml-c14n>.freeze, [">= 0".freeze])
end
