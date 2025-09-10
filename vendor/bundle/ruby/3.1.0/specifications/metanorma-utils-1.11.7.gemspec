# -*- encoding: utf-8 -*-
# stub: metanorma-utils 1.11.7 ruby lib

Gem::Specification.new do |s|
  s.name = "metanorma-utils".freeze
  s.version = "1.11.7".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.date = "2025-07-23"
  s.description = "metanorma-utils provides utilities for the Metanorma stack\n".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/metanorma-utils".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.1.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "metanorma-utils".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<asciidoctor>.freeze, [">= 2".freeze])
  s.add_runtime_dependency(%q<concurrent-ruby>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<csv>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<htmlentities>.freeze, ["~> 4.3.4".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.11".freeze])
  s.add_runtime_dependency(%q<sterile>.freeze, ["~> 1.0.14".freeze])
  s.add_runtime_dependency(%q<uuidtools>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0".freeze])
  s.add_development_dependency(%q<debug>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<equivalent-xml>.freeze, ["~> 0.6".freeze])
  s.add_development_dependency(%q<guard>.freeze, ["~> 2.14".freeze])
  s.add_development_dependency(%q<guard-rspec>.freeze, ["~> 4.7".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1".freeze])
  s.add_development_dependency(%q<rubocop-performance>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.15".freeze])
  s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9".freeze])
  s.add_development_dependency(%q<webmock>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<xml-c14n>.freeze, [">= 0".freeze])
end
