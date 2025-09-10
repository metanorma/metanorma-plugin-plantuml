# -*- encoding: utf-8 -*-
# stub: isodoc-i18n 1.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "isodoc-i18n".freeze
  s.version = "1.3.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.date = "2025-02-13"
  s.description = "Internationalisation for Metanorma rendering\n".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/isodoc-i18n".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "isodoc-i18n".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<htmlentities>.freeze, ["~> 4.3.4".freeze])
  s.add_runtime_dependency(%q<liquid>.freeze, ["~> 5".freeze])
  s.add_runtime_dependency(%q<metanorma-utils>.freeze, [">= 1.7.0".freeze])
  s.add_runtime_dependency(%q<twitter_cldr>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<base64>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<debug>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<equivalent-xml>.freeze, ["~> 0.6".freeze])
  s.add_development_dependency(%q<guard>.freeze, ["~> 2.14".freeze])
  s.add_development_dependency(%q<guard-rspec>.freeze, ["~> 4.7".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.5.2".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.15".freeze])
  s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9".freeze])
  s.add_development_dependency(%q<webmock>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<xml-c14n>.freeze, [">= 0".freeze])
end
