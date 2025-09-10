# -*- encoding: utf-8 -*-
# stub: iso639 1.3.3 ruby lib

Gem::Specification.new do |s|
  s.name = "iso639".freeze
  s.version = "1.3.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/rmm5t/iso639/issues", "changelog_uri" => "https://github.com/rmm5t/iso639/releases", "funding_uri" => "https://github.com/sponsors/rmm5t", "source_code_uri" => "https://github.com/rmm5t/iso639" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan McGeary".freeze]
  s.date = "2024-12-10"
  s.description = "ISO 639-1 and ISO 639-2 lookups by name, alpha-2 code, or alpha-3 code".freeze
  s.email = ["ryan@mcgeary.org".freeze]
  s.homepage = "https://github.com/rmm5t/iso639".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.23".freeze
  s.summary = "ISO 639-1 and ISO 639-2 lookups by name, alpha-2 code, or alpha-3 code".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
end
