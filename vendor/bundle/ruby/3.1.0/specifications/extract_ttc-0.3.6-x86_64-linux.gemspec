# -*- encoding: utf-8 -*-
# stub: extract_ttc 0.3.6 x86_64-linux lib

Gem::Specification.new do |s|
  s.name = "extract_ttc".freeze
  s.version = "0.3.6".freeze
  s.platform = "x86_64-linux".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/fontist/extract_ttc", "homepage_uri" => "https://github.com/fontist/extract_ttc", "rubygems_mfa_required" => "false", "source_code_uri" => "https://github.com/fontist/extract_ttc" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-03-27"
  s.description = "Extract font collection to separate font files".freeze
  s.email = ["operations@ribose.com".freeze]
  s.homepage = "https://github.com/fontist/extract_ttc".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Extract TTC file to TTF files".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<bundler>.freeze, ["~> 2.3".freeze, ">= 2.3.22".freeze])
  s.add_runtime_dependency(%q<ffi>.freeze, ["~> 1.0".freeze])
  s.add_runtime_dependency(%q<rake>.freeze, ["~> 13".freeze])
end
