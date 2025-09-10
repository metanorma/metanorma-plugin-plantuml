# -*- encoding: utf-8 -*-
# stub: excavate 0.3.7 ruby lib

Gem::Specification.new do |s|
  s.name = "excavate".freeze
  s.version = "0.3.7".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/fontist/excavate", "homepage_uri" => "https://github.com/fontist/excavate", "rubygems_mfa_required" => "false", "source_code_uri" => "https://github.com/fontist/excavate" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-02-13"
  s.description = "Extract nested archives with a single command.".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["excavate".freeze]
  s.files = ["exe/excavate".freeze]
  s.homepage = "https://github.com/fontist/excavate".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.3".freeze
  s.summary = "Extract nested archives with a single command.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<arr-pm>.freeze, ["~> 0.0".freeze])
  s.add_runtime_dependency(%q<bundler>.freeze, ["~> 2.3".freeze, ">= 2.3.24".freeze])
  s.add_runtime_dependency(%q<ffi-compiler2>.freeze, [">= 2.2.2".freeze])
  s.add_runtime_dependency(%q<ffi-libarchive-binary>.freeze, ["~> 0.3".freeze])
  s.add_runtime_dependency(%q<libmspack>.freeze, ["~> 0.1".freeze])
  s.add_runtime_dependency(%q<ruby-ole>.freeze, ["~> 1.0".freeze])
  s.add_runtime_dependency(%q<rubyzip>.freeze, ["~> 2.3".freeze])
  s.add_runtime_dependency(%q<seven-zip>.freeze, ["~> 1.4".freeze])
  s.add_runtime_dependency(%q<thor>.freeze, ["~> 1.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.7".freeze])
  s.add_development_dependency(%q<rubocop-performance>.freeze, ["~> 1.15".freeze])
end
