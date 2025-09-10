# -*- encoding: utf-8 -*-
# stub: rdf-turtle 3.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rdf-turtle".freeze
  s.version = "3.3.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/ruby-rdf/rdf-turtle/issues", "documentation_uri" => "https://ruby-rdf.github.io/rdf-turtle", "homepage_uri" => "https://github.com/ruby-rdf/rdf-turtle", "mailing_list_uri" => "https://lists.w3.org/Archives/Public/public-rdf-ruby/", "source_code_uri" => "https://github.com/ruby-rdf/rdf-turtle" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gregg Kellogg".freeze]
  s.date = "2024-03-17"
  s.description = "RDF::Turtle is an Turtle reader/writer for the RDF.rb library suite.".freeze
  s.email = "public-rdf-ruby@w3.org".freeze
  s.homepage = "https://github.com/ruby-rdf/rdf-turtle".freeze
  s.licenses = ["Unlicense".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0".freeze)
  s.rubygems_version = "3.4.19".freeze
  s.summary = "Turtle reader/writer for Ruby.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<rdf>.freeze, ["~> 3.3".freeze])
  s.add_runtime_dependency(%q<ebnf>.freeze, ["~> 2.5".freeze])
  s.add_runtime_dependency(%q<base64>.freeze, ["~> 0.2".freeze])
  s.add_runtime_dependency(%q<bigdecimal>.freeze, ["~> 3.1".freeze, ">= 3.1.5".freeze])
  s.add_development_dependency(%q<erubis>.freeze, ["~> 2.7".freeze])
  s.add_development_dependency(%q<getoptlong>.freeze, ["~> 0.2".freeze])
  s.add_development_dependency(%q<htmlentities>.freeze, ["~> 4.3".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.12".freeze])
  s.add_development_dependency(%q<rspec-its>.freeze, ["~> 1.3".freeze])
  s.add_development_dependency(%q<rdf-isomorphic>.freeze, ["~> 3.3".freeze])
  s.add_development_dependency(%q<json-ld>.freeze, ["~> 3.3".freeze])
  s.add_development_dependency(%q<rdf-spec>.freeze, ["~> 3.3".freeze])
  s.add_development_dependency(%q<rdf-vocab>.freeze, ["~> 3.3".freeze])
end
