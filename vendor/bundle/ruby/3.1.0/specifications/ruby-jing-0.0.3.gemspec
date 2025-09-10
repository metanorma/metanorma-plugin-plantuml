# -*- encoding: utf-8 -*-
# stub: ruby-jing 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-jing".freeze
  s.version = "0.0.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Skye Shaw".freeze]
  s.date = "2022-06-22"
  s.description = "    RELAX NG schema validation using Jing, a Java based RELAX NG validator that emits clear,\n    detailed validation errors. ruby-jing validates XML documents by wrapping Jing's java\n    command-line user interface.\n".freeze
  s.email = "skye.shaw@gmail.com".freeze
  s.extra_rdoc_files = ["README.rdoc".freeze]
  s.files = ["README.rdoc".freeze]
  s.homepage = "http://github.com/sshaw/ruby-jing".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "RELAX NG schema validation using the Jing CLI".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<optout>.freeze, [">= 0.0.2".freeze])
  s.add_development_dependency(%q<bundler>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 12.3.3".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 4.0".freeze])
end
