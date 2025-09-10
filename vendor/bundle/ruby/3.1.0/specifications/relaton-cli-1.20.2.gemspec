# -*- encoding: utf-8 -*-
# stub: relaton-cli 1.20.2 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-cli".freeze
  s.version = "1.20.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-05-22"
  s.description = "Relaton Command-line Interface".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["relaton".freeze]
  s.extra_rdoc_files = ["docs/README.adoc".freeze, "LICENSE".freeze]
  s.files = ["LICENSE".freeze, "docs/README.adoc".freeze, "exe/relaton".freeze]
  s.homepage = "https://github.com/metanorma/relaton-cli".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Relaton Command-line Interface".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<liquid>.freeze, ["~> 5".freeze])
  s.add_runtime_dependency(%q<relaton>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<thor>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<thor-hollaback>.freeze, [">= 0".freeze])
end
