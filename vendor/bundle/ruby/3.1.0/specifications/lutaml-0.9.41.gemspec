# -*- encoding: utf-8 -*-
# stub: lutaml 0.9.41 ruby lib

Gem::Specification.new do |s|
  s.name = "lutaml".freeze
  s.version = "0.9.41"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/lutaml/lutaml/releases", "homepage_uri" => "https://github.com/lutaml/lutaml", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/lutaml/lutaml" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-09-05"
  s.description = "LutaML: data models in textual form".freeze
  s.email = ["open.source@ribose.com'".freeze]
  s.executables = ["lutaml".freeze, "lutaml-sysml".freeze, "lutaml-wsd2uml".freeze, "lutaml-yaml2uml".freeze]
  s.files = ["exe/lutaml".freeze, "exe/lutaml-sysml".freeze, "exe/lutaml-wsd2uml".freeze, "exe/lutaml-yaml2uml".freeze]
  s.homepage = "https://github.com/lutaml/lutaml".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "LutaML: data models in textual form".freeze

  s.installed_by_version = "3.3.27" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<expressir>.freeze, ["~> 2.1.0"])
    s.add_runtime_dependency(%q<hashie>.freeze, ["~> 4.1.0"])
    s.add_runtime_dependency(%q<htmlentities>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<liquid>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<lutaml-model>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<lutaml-path>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<lutaml-xsd>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.10"])
    s.add_runtime_dependency(%q<parslet>.freeze, ["~> 2.0.0"])
    s.add_runtime_dependency(%q<ruby-graphviz>.freeze, ["~> 1.2"])
    s.add_runtime_dependency(%q<thor>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<xmi>.freeze, ["~> 0.3.20"])
  else
    s.add_dependency(%q<expressir>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<hashie>.freeze, ["~> 4.1.0"])
    s.add_dependency(%q<htmlentities>.freeze, [">= 0"])
    s.add_dependency(%q<liquid>.freeze, [">= 0"])
    s.add_dependency(%q<lutaml-model>.freeze, [">= 0"])
    s.add_dependency(%q<lutaml-path>.freeze, [">= 0"])
    s.add_dependency(%q<lutaml-xsd>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.10"])
    s.add_dependency(%q<parslet>.freeze, ["~> 2.0.0"])
    s.add_dependency(%q<ruby-graphviz>.freeze, ["~> 1.2"])
    s.add_dependency(%q<thor>.freeze, ["~> 1.0"])
    s.add_dependency(%q<xmi>.freeze, ["~> 0.3.20"])
  end
end
