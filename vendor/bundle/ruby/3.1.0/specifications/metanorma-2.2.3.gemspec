# -*- encoding: utf-8 -*-
# stub: metanorma 2.2.3 ruby lib

Gem::Specification.new do |s|
  s.name = "metanorma".freeze
  s.version = "2.2.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.date = "2025-08-04"
  s.description = "Library to process any Metanorma standard.".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.extra_rdoc_files = ["README.adoc".freeze, "CHANGELOG.adoc".freeze, "LICENSE.txt".freeze]
  s.files = ["CHANGELOG.adoc".freeze, "LICENSE.txt".freeze, "README.adoc".freeze]
  s.homepage = "https://github.com/metanorma/metanorma".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.1.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Metanorma is the standard of standards; the metanorma gem allows you to create any standard document type supported by Metanorma.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<asciidoctor>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<concurrent-ruby>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<fontist>.freeze, [">= 1.14.3".freeze])
  s.add_runtime_dependency(%q<htmlentities>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<isodoc>.freeze, [">= 3.0.0".freeze])
  s.add_runtime_dependency(%q<metanorma-taste>.freeze, ["~> 0.1.0".freeze])
  s.add_runtime_dependency(%q<mn2pdf>.freeze, ["~> 2".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<debug>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<equivalent-xml>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<metanorma-iso>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<mnconvert>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<pry>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<rspec-command>.freeze, ["~> 1.0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1".freeze])
  s.add_development_dependency(%q<rubocop-performance>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<sassc-embedded>.freeze, ["~> 1".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.15".freeze])
  s.add_development_dependency(%q<canon>.freeze, [">= 0".freeze])
end
