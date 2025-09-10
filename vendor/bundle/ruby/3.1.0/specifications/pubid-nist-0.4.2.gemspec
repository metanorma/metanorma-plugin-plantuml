# -*- encoding: utf-8 -*-
# stub: pubid-nist 0.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "pubid-nist".freeze
  s.version = "0.4.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-10-16"
  s.description = "Library to generate, parse and manipulate NIST PubID.".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["pubid-nist".freeze]
  s.extra_rdoc_files = ["README.adoc".freeze, "LICENSE.txt".freeze]
  s.files = ["LICENSE.txt".freeze, "README.adoc".freeze, "exe/pubid-nist".freeze]
  s.homepage = "https://github.com/metanorma/pubid-nist".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "Library to generate, parse and manipulate NIST PubID.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<vcr>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<webmock>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<thor>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<lightly>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<parslet>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<pubid-core>.freeze, ["~> 1.12.2".freeze])
  s.add_runtime_dependency(%q<rubyzip>.freeze, [">= 0".freeze])
end
