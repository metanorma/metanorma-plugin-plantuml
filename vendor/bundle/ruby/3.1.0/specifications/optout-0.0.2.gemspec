# -*- encoding: utf-8 -*-
# stub: optout 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "optout".freeze
  s.version = "0.0.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Skye Shaw".freeze]
  s.date = "2012-03-03"
  s.description = "    Optout helps you write code that will call exec() and system() like functions. It allows you to map hash keys to command line \n    arguments and define validation rules that must be met before the command line options are created. \n".freeze
  s.email = "sshaw@lucas.cis.temple.edu".freeze
  s.extra_rdoc_files = ["README.rdoc".freeze]
  s.files = ["README.rdoc".freeze]
  s.homepage = "http://github.com/sshaw/optout".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "1.8.10".freeze
  s.summary = "The opposite of getopt(): validate an option hash and turn it into something appropriate for exec() and system() like functions".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 3

  s.add_development_dependency(%q<rake>.freeze, ["~> 0.9.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 2.8.0".freeze])
end
