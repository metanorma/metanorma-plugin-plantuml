# -*- encoding: utf-8 -*-
# stub: rspec-html-matchers 0.10.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-html-matchers".freeze
  s.version = "0.10.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["kucaahbe".freeze]
  s.date = "2022-07-26"
  s.description = "Nokogiri based 'have_tag' and 'with_tag' matchers for RSpec. Does not depend on assert_select matcher, provides useful error messages.\n".freeze
  s.email = ["kucaahbe@ukr.net".freeze, "randoum@gmail.com".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "CHANGELOG.md".freeze]
  s.files = ["CHANGELOG.md".freeze, "README.md".freeze]
  s.homepage = "https://github.com/kucaahbe/rspec-html-matchers".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7".freeze)
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Nokogiri based 'have_tag' and 'with_tag' matchers for RSpec".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<rspec>.freeze, [">= 3.0.0.a".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1".freeze])
  s.add_development_dependency(%q<cucumber>.freeze, ["~> 1".freeze])
  s.add_development_dependency(%q<capybara>.freeze, ["~> 2".freeze])
  s.add_development_dependency(%q<sinatra>.freeze, ["~> 1".freeze])
  s.add_development_dependency(%q<selenium-webdriver>.freeze, ["~> 3".freeze])
  s.add_development_dependency(%q<webdrivers>.freeze, ["~> 4".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10".freeze])
  s.add_development_dependency(%q<yard>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["= 0.76.0".freeze])
end
