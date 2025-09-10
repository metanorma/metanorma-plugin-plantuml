# -*- encoding: utf-8 -*-
# stub: relaton-index 0.2.16 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton-index".freeze
  s.version = "0.2.16".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/relaton/relaton-index", "source_code_uri" => "https://github.com/relaton/relaton-index" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-08-19"
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/relaton/relaton-index".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "Relaton Index is a library for indexing Relaton files.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<pubid-core>.freeze, ["~> 1.12.9".freeze])
  s.add_runtime_dependency(%q<relaton-logger>.freeze, ["~> 0.2.0".freeze])
  s.add_runtime_dependency(%q<rubyzip>.freeze, ["~> 2.3.0".freeze])
end
