# -*- encoding: utf-8 -*-
# stub: thor-hollaback 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "thor-hollaback".freeze
  s.version = "0.2.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/kddnewton/thor-hollaback/issues", "changelog_uri" => "https://github.com/kddnewton/thor-hollaback/blob/v0.2.1/CHANGELOG.md", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/kddnewton/thor-hollaback" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kevin Newton".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-11-18"
  s.email = ["kddnewton@gmail.com".freeze]
  s.homepage = "https://github.com/kddnewton/thor-hollaback".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.3".freeze
  s.summary = "Adds callbacks to thor commands".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<hollaback>.freeze, ["~> 0.1".freeze])
  s.add_runtime_dependency(%q<thor>.freeze, [">= 0.19.1".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.11".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.12".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.15".freeze])
end
