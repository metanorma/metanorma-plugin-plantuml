# -*- encoding: utf-8 -*-
# stub: mml 2.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "mml".freeze
  s.version = "2.0.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-03-29"
  s.description = "MathML parser and builder used in Plurimath.\n".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/plurimath/mml".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "MathML parser by Plurimath.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<lutaml-model>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<moxml>.freeze, [">= 0".freeze])
end
