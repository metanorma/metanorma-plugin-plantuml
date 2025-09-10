# -*- encoding: utf-8 -*-
# stub: plane1converter 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "plane1converter".freeze
  s.version = "0.0.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.date = "2020-09-14"
  s.description = "Convert characters + font shifts to Plane 1 Mathematical Alphanumeric Symbols\n".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/plurimath/plane1converter".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Convert characters + font shifts to Plane 1 Mathematical Alphanumeric Symbols".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<byebug>.freeze, ["~> 9.1".freeze])
  s.add_development_dependency(%q<rspec-match_fuzzy>.freeze, ["~> 0.1.3".freeze])
  s.add_development_dependency(%q<guard>.freeze, ["~> 2.14".freeze])
  s.add_development_dependency(%q<guard-rspec>.freeze, ["~> 4.7".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 12.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["= 0.54.0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.15".freeze])
  s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9".freeze])
end
