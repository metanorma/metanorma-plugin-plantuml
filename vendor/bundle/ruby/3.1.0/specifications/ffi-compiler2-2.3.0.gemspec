# -*- encoding: utf-8 -*-
# stub: ffi-compiler2 2.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ffi-compiler2".freeze
  s.version = "2.3.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["D\u0101vis".freeze]
  s.date = "2024-02-13"
  s.description = "Ruby FFI library".freeze
  s.email = "davispuh@gmail.com".freeze
  s.homepage = "https://gitlab.com/davispuh/ffi-compiler".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9".freeze)
  s.rubygems_version = "3.5.6".freeze
  s.summary = "Ruby FFI Rakefile generator".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<ffi>.freeze, [">= 1.0.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rubygems-tasks>.freeze, [">= 0".freeze])
end
