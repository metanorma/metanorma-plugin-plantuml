# -*- encoding: utf-8 -*-
# stub: relaton-render 0.9.3 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-render".freeze
  s.version = "0.9.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-07-05"
  s.description = "Rendering of ISO 690 XML".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/relaton/relaton-render".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Rendering of ISO 690 XML".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<debug>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<equivalent-xml>.freeze, ["~> 0.6".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 12.3.3".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<isodoc-i18n>.freeze, ["~> 1.3.0".freeze])
  s.add_runtime_dependency(%q<liquid>.freeze, ["~> 5".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<relaton-bib>.freeze, [">= 1.20.0".freeze])
  s.add_runtime_dependency(%q<twitter_cldr>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<tzinfo-data>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<base64>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<bigdecimal>.freeze, [">= 0".freeze])
end
