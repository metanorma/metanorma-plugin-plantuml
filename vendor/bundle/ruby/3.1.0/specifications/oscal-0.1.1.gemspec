# -*- encoding: utf-8 -*-
# stub: oscal 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "oscal".freeze
  s.version = "0.1.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/metanorma/oscal-ruby/CHANGELOG", "homepage_uri" => "https://github.com/metanorma/oscal-ruby/", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/metanorma/oscal-ruby/" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-05-14"
  s.description = "Ruby library and parser for OSCAL models".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["convert2oscalyaml.rb".freeze]
  s.files = ["exe/convert2oscalyaml.rb".freeze]
  s.homepage = "https://github.com/metanorma/oscal-ruby/".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Interact with OSCAL models".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<yaml>.freeze, [">= 0".freeze])
end
