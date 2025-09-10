# -*- encoding: utf-8 -*-
# stub: pngcheck 0.3.1 x86_64-linux lib

Gem::Specification.new do |s|
  s.name = "pngcheck".freeze
  s.version = "0.3.1".freeze
  s.platform = "x86_64-linux".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/metanorma/pngcheck-ruby", "homepage_uri" => "https://github.com/metanorma/pngcheck-ruby", "source_code_uri" => "https://github.com/metanorma/pngcheck-ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.date = "2022-10-14"
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/pngcheck-ruby".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Ruby interface to pngcheck.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<bundler>.freeze, ["~> 2.3".freeze, ">= 2.3.22".freeze])
  s.add_runtime_dependency(%q<ffi>.freeze, ["~> 1.0".freeze])
  s.add_runtime_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<libpng-ruby>.freeze, ["~> 0.6".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.4".freeze])
end
