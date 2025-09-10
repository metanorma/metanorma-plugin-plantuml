# -*- encoding: utf-8 -*-
# stub: loc_mods 0.2.7 ruby lib

Gem::Specification.new do |s|
  s.name = "loc_mods".freeze
  s.version = "0.2.7".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/relaton/loc_mods", "homepage_uri" => "https://github.com/relaton/loc_mods", "source_code_uri" => "https://github.com/relaton/loc_mods" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-01-14"
  s.description = "Library of Congress MODS / MADS parser".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["loc-mods".freeze]
  s.files = ["exe/loc-mods".freeze]
  s.homepage = "https://github.com/relaton/loc_mods".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "Library of Congress MODS / MADS parser".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<lutaml-model>.freeze, ["~> 0.5".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<thor>.freeze, [">= 0".freeze])
end
