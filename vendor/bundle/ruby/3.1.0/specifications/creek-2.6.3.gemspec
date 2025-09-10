# -*- encoding: utf-8 -*-
# stub: creek 2.6.3 ruby lib

Gem::Specification.new do |s|
  s.name = "creek".freeze
  s.version = "2.6.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["pythonicrubyist".freeze]
  s.date = "2023-05-03"
  s.description = "A Ruby gem that streams and parses large Excel(xlsx and xlsm) files fast and efficiently.".freeze
  s.email = ["pythonicrubyist@gmail.com".freeze]
  s.homepage = "https://github.com/pythonicrubyist/creek".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.0.3.1".freeze
  s.summary = "A Ruby gem for parsing large Excel(xlsx and xlsm) files.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6.0".freeze])
  s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.10.0".freeze])
  s.add_runtime_dependency(%q<rubyzip>.freeze, [">= 1.0.0".freeze])
end
