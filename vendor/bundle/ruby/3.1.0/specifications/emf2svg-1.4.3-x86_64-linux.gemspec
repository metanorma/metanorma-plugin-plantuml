# -*- encoding: utf-8 -*-
# stub: emf2svg 1.4.3 x86_64-linux lib

Gem::Specification.new do |s|
  s.name = "emf2svg".freeze
  s.version = "1.4.3".freeze
  s.platform = "x86_64-linux".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/metanorma/emf2svg-ruby", "homepage_uri" => "https://github.com/metanorma/emf2svg-ruby", "source_code_uri" => "https://github.com/metanorma/emf2svg-ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-10-26"
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["emf2svg".freeze]
  s.files = ["exe/emf2svg".freeze]
  s.homepage = "https://github.com/metanorma/emf2svg-ruby".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.1.6".freeze
  s.summary = "EMF to SVG conversion in Ruby.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<ffi>.freeze, ["~> 1.0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["= 1.5.2".freeze])
  s.add_development_dependency(%q<rubocop-performance>.freeze, ["~> 1.0".freeze])
  s.add_development_dependency(%q<rubocop-rails>.freeze, ["~> 2.0".freeze])
end
