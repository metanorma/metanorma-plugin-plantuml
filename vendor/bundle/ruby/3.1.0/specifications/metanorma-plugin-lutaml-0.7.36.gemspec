# -*- encoding: utf-8 -*-
# stub: metanorma-plugin-lutaml 0.7.36 ruby lib

Gem::Specification.new do |s|
  s.name = "metanorma-plugin-lutaml".freeze
  s.version = "0.7.36".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "false" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-08-15"
  s.description = "Metanorma plugin for LutaML".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/metanorma-plugin-lutaml".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Metanorma plugin for LutaML".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<asciidoctor>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<coradoc>.freeze, ["~> 1.1".freeze])
  s.add_runtime_dependency(%q<expressir>.freeze, ["~> 2.1".freeze])
  s.add_runtime_dependency(%q<isodoc>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<liquid>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<lutaml>.freeze, ["~> 0.9".freeze])
  s.add_runtime_dependency(%q<ogc-gml>.freeze, ["~> 1.0.0".freeze])
  s.add_runtime_dependency(%q<relaton-cli>.freeze, [">= 0".freeze])
end
