# -*- encoding: utf-8 -*-
# stub: lutaml-hal 0.1.10 ruby lib

Gem::Specification.new do |s|
  s.name = "lutaml-hal".freeze
  s.version = "0.1.10".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/lutaml/lutaml-hal/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/lutaml/lutaml-hal", "source_code_uri" => "https://github.com/lutaml/lutaml-hal" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.date = "2025-07-09"
  s.description = "Hypertext Application Language (HAL) implementation for Lutaml model".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/lutaml/lutaml-hal".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "HAL implementation for LutaML".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<faraday>.freeze, ["~> 2.0".freeze])
  s.add_runtime_dependency(%q<faraday-follow_redirects>.freeze, ["~> 0.3".freeze])
  s.add_runtime_dependency(%q<lutaml-model>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<rainbow>.freeze, ["~> 3.0".freeze])
end
