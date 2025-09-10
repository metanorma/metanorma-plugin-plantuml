# -*- encoding: utf-8 -*-
# stub: libmspack 0.11.0 ruby lib
# stub: ext/Rakefile

Gem::Specification.new do |s|
  s.name = "libmspack".freeze
  s.version = "0.11.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["D\u0101vis".freeze]
  s.date = "2024-02-11"
  s.description = "A library for compressing and decompressing some loosely related Microsoft compression formats, CAB, CHM, HLP, LIT, KWAJ and SZDD.".freeze
  s.email = ["davispuh@gmail.com".freeze]
  s.extensions = ["ext/Rakefile".freeze]
  s.files = ["ext/Rakefile".freeze]
  s.homepage = "https://gitlab.com/davispuh/ruby-libmspack".freeze
  s.licenses = ["UNLICENSE".freeze, "LGPL-2".freeze]
  s.rubygems_version = "3.5.6".freeze
  s.summary = "Ruby wrapper for libmspack.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<ffi>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<ffi-compiler2>.freeze, [">= 2.0.0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<yard>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0".freeze])
end
