# -*- encoding: utf-8 -*-
# stub: metanorma-plugin-glossarist 0.2.9 ruby lib

Gem::Specification.new do |s|
  s.name = "metanorma-plugin-glossarist".freeze
  s.version = "0.2.9".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-07-17"
  s.description = "Metanorma plugin for glossarist".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/metanorma-plugin-glossarist".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Metanorma plugin for glossarist".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<asciidoctor>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<glossarist>.freeze, ["~> 2.3.7".freeze])
  s.add_runtime_dependency(%q<liquid>.freeze, [">= 0".freeze])
end
