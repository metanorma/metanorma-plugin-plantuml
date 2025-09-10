# -*- encoding: utf-8 -*-
# stub: plurimath 0.9.10 ruby lib

Gem::Specification.new do |s|
  s.name = "plurimath".freeze
  s.version = "0.9.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/plurimath/plurimath", "source_code_uri" => "https://github.com/plurimath/plurimath" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-09-03"
  s.description = "Converts LaTeX math into MathML.".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["plurimath".freeze]
  s.files = ["exe/plurimath".freeze]
  s.homepage = "https://github.com/plurimath/plurimath".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "Converts LaTeX math into MathML.".freeze

  s.installed_by_version = "3.3.27" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<ox>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<mml>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<thor>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<parslet>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<unitsml>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<bigdecimal>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<lutaml-model>.freeze, [">= 0"])
  else
    s.add_dependency(%q<ox>.freeze, [">= 0"])
    s.add_dependency(%q<mml>.freeze, [">= 0"])
    s.add_dependency(%q<thor>.freeze, [">= 0"])
    s.add_dependency(%q<parslet>.freeze, [">= 0"])
    s.add_dependency(%q<unitsml>.freeze, [">= 0"])
    s.add_dependency(%q<bigdecimal>.freeze, [">= 0"])
    s.add_dependency(%q<lutaml-model>.freeze, [">= 0"])
  end
end
