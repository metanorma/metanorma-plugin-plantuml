# -*- encoding: utf-8 -*-
# stub: expressir 2.1.25 ruby lib

Gem::Specification.new do |s|
  s.name = "expressir".freeze
  s.version = "2.1.25"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/lutaml/expressir/releases", "homepage_uri" => "https://github.com/lutaml/expressir", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/lutaml/expressir" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-08-15"
  s.description = "Expressir (\"EXPRESS in Ruby\") is a Ruby parser for EXPRESS and a set of tools for accessing EXPRESS data models.".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["expressir".freeze]
  s.files = ["exe/expressir".freeze]
  s.homepage = "https://github.com/lutaml/expressir".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "EXPRESS parser and toolkit for Ruby".freeze

  s.installed_by_version = "3.3.27" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<base64>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<benchmark-ips>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<csv>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<liquid>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<lutaml-model>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<parslet>.freeze, ["~> 2.0"])
    s.add_runtime_dependency(%q<ruby-progressbar>.freeze, ["~> 1.11"])
    s.add_runtime_dependency(%q<terminal-table>.freeze, ["~> 3.0"])
    s.add_runtime_dependency(%q<thor>.freeze, ["~> 1.0"])
  else
    s.add_dependency(%q<base64>.freeze, [">= 0"])
    s.add_dependency(%q<benchmark-ips>.freeze, [">= 0"])
    s.add_dependency(%q<csv>.freeze, [">= 0"])
    s.add_dependency(%q<liquid>.freeze, [">= 0"])
    s.add_dependency(%q<lutaml-model>.freeze, [">= 0"])
    s.add_dependency(%q<parslet>.freeze, ["~> 2.0"])
    s.add_dependency(%q<ruby-progressbar>.freeze, ["~> 1.11"])
    s.add_dependency(%q<terminal-table>.freeze, ["~> 3.0"])
    s.add_dependency(%q<thor>.freeze, ["~> 1.0"])
  end
end
