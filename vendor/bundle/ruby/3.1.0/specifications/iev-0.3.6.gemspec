# -*- encoding: utf-8 -*-
# stub: iev 0.3.6 ruby lib

Gem::Specification.new do |s|
  s.name = "iev".freeze
  s.version = "0.3.6".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-05-12"
  s.description = "Iev: Fetch and encode Iev term from Electropedia".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["iev".freeze]
  s.files = ["exe/iev".freeze]
  s.homepage = "https://github.com/metanorma/iev".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.1.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Iev: Fetch and encode Iev term from Electropedia".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<creek>.freeze, ["~> 2.5".freeze])
  s.add_runtime_dependency(%q<glossarist>.freeze, [">= 2.3.0".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.16.5".freeze])
  s.add_runtime_dependency(%q<plurimath>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<relaton>.freeze, ["~> 1.18".freeze])
  s.add_runtime_dependency(%q<sequel>.freeze, ["~> 5.40".freeze])
  s.add_runtime_dependency(%q<sqlite3>.freeze, ["~> 1.7.0".freeze])
  s.add_runtime_dependency(%q<thor>.freeze, ["~> 1.0".freeze])
  s.add_runtime_dependency(%q<unitsml>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<zeitwerk>.freeze, ["~> 2.4".freeze])
end
