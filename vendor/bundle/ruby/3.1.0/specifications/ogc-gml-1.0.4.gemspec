# -*- encoding: utf-8 -*-
# stub: ogc-gml 1.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "ogc-gml".freeze
  s.version = "1.0.4".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/lutaml/ogc-gml/releases", "homepage_uri" => "https://github.com/lutaml/ogc-gml", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/lutaml/ogc-gml" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-03-19"
  s.description = "OGC GML data model parser".freeze
  s.email = ["open.source@ribose.com'".freeze]
  s.homepage = "https://github.com/lutaml/ogc-gml".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "OGC GML data model parser".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<lutaml-model>.freeze, ["~> 0.7".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0".freeze])
end
