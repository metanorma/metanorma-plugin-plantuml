# -*- encoding: utf-8 -*-
# stub: html2doc 1.10.0 ruby lib

Gem::Specification.new do |s|
  s.name = "html2doc".freeze
  s.version = "1.10.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.date = "2025-07-02"
  s.description = "Convert HTML document to Microsoft Word document.\n\nThis gem is in active development.\n".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/html2doc".freeze
  s.licenses = ["CC-BY-SA-3.0".freeze, "BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Convert HTML document to Microsoft Word document".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<base64>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<htmlentities>.freeze, ["~> 4.3.4".freeze])
  s.add_runtime_dependency(%q<lutaml-model>.freeze, ["~> 0.7.0".freeze])
  s.add_runtime_dependency(%q<metanorma-utils>.freeze, [">= 1.9.0".freeze])
  s.add_runtime_dependency(%q<mime-types>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.18.3".freeze])
  s.add_runtime_dependency(%q<plane1converter>.freeze, ["~> 0.0.1".freeze])
  s.add_runtime_dependency(%q<plurimath>.freeze, ["~> 0.9.0".freeze])
  s.add_runtime_dependency(%q<thread_safe>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<uuidtools>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<unitsml>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<vectory>.freeze, ["~> 0.8".freeze])
  s.add_development_dependency(%q<debug>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<equivalent-xml>.freeze, ["~> 0.6".freeze])
  s.add_development_dependency(%q<guard>.freeze, ["~> 2.14".freeze])
  s.add_development_dependency(%q<guard-rspec>.freeze, ["~> 4.7".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 12.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6".freeze])
  s.add_development_dependency(%q<rspec-match_fuzzy>.freeze, ["~> 0.2.0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1".freeze])
  s.add_development_dependency(%q<rubocop-performance>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.15".freeze])
  s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9".freeze])
end
