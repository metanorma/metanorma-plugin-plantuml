# -*- encoding: utf-8 -*-
# stub: coradoc 1.1.7 ruby lib

Gem::Specification.new do |s|
  s.name = "coradoc".freeze
  s.version = "1.1.7".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://www.metanorma.org", "source_code_uri" => "https://github.com/metanorma/coradoc" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze, "Abu Nashir".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-03-25"
  s.description = "Experimental AsciiDoc parser for metanorma".freeze
  s.email = ["open.source@ribose.com".freeze, "abunashir@gmail.com".freeze]
  s.executables = ["coradoc".freeze, "reverse_adoc".freeze, "w2a".freeze]
  s.files = ["exe/coradoc".freeze, "exe/reverse_adoc".freeze, "exe/w2a".freeze]
  s.homepage = "https://www.metanorma.org".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.1.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "AsciiDoc parser for metanorma".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<base64>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<marcel>.freeze, ["~> 1.0.0".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.13".freeze])
  s.add_runtime_dependency(%q<oscal>.freeze, ["~> 0.1.1".freeze])
  s.add_runtime_dependency(%q<parslet>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<plurimath>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<thor>.freeze, [">= 1.3.0".freeze])
  s.add_runtime_dependency(%q<unitsml>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<word-to-markdown>.freeze, [">= 0".freeze])
end
