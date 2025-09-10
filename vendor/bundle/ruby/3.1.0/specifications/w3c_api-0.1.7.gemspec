# -*- encoding: utf-8 -*-
# stub: w3c_api 0.1.7 ruby lib

Gem::Specification.new do |s|
  s.name = "w3c_api".freeze
  s.version = "0.1.7".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/relaton/w3c-api", "homepage_uri" => "https://github.com/relaton/w3c-api", "source_code_uri" => "https://github.com/relaton/w3c-api" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-08-12"
  s.description = "A Ruby wrapper for the W3C web API with a CLI interface".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["w3c_api".freeze]
  s.files = ["exe/w3c_api".freeze]
  s.homepage = "https://github.com/relaton/w3c-api".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.1.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Ruby client for the W3C API".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<faraday>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<faraday-follow_redirects>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<lutaml-hal>.freeze, ["~> 0.1.10".freeze])
  s.add_runtime_dependency(%q<rainbow>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<thor>.freeze, [">= 0".freeze])
end
