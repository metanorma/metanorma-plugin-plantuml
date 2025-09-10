# -*- encoding: utf-8 -*-
# stub: isodoc 3.2.6 ruby lib

Gem::Specification.new do |s|
  s.name = "isodoc".freeze
  s.version = "3.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.date = "2025-09-02"
  s.description = "isodoc converts documents in the IsoDoc document model into\nMicrosoft Word and HTML.\n\nThis gem is in active development.\n".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/metanorma/isodoc".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.1.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "Convert documents in IsoDoc into Word and HTML in AsciiDoc.".freeze

  s.installed_by_version = "3.3.27" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<base64>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<bigdecimal>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<html2doc>.freeze, ["~> 1.10.0"])
    s.add_runtime_dependency(%q<mn2pdf>.freeze, [">= 2.13"])
    s.add_runtime_dependency(%q<mn-requirements>.freeze, ["~> 0.5.0"])
    s.add_runtime_dependency(%q<relaton-render>.freeze, ["~> 0.9.0"])
    s.add_runtime_dependency(%q<roman-numerals>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rouge>.freeze, ["~> 4.0"])
    s.add_runtime_dependency(%q<thread_safe>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<twitter_cldr>.freeze, [">= 6.6.0"])
    s.add_runtime_dependency(%q<uuidtools>.freeze, [">= 0"])
    s.add_development_dependency(%q<bigdecimal>.freeze, [">= 0"])
    s.add_development_dependency(%q<debug>.freeze, [">= 0"])
    s.add_development_dependency(%q<equivalent-xml>.freeze, ["~> 0.6"])
    s.add_development_dependency(%q<guard>.freeze, ["~> 2.14"])
    s.add_development_dependency(%q<guard-rspec>.freeze, ["~> 4.7"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 1"])
    s.add_development_dependency(%q<rubocop-performance>.freeze, [">= 0"])
    s.add_development_dependency(%q<sassc-embedded>.freeze, ["~> 1"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.15"])
    s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9"])
    s.add_development_dependency(%q<canon>.freeze, [">= 0"])
  else
    s.add_dependency(%q<base64>.freeze, [">= 0"])
    s.add_dependency(%q<bigdecimal>.freeze, [">= 0"])
    s.add_dependency(%q<html2doc>.freeze, ["~> 1.10.0"])
    s.add_dependency(%q<mn2pdf>.freeze, [">= 2.13"])
    s.add_dependency(%q<mn-requirements>.freeze, ["~> 0.5.0"])
    s.add_dependency(%q<relaton-render>.freeze, ["~> 0.9.0"])
    s.add_dependency(%q<roman-numerals>.freeze, [">= 0"])
    s.add_dependency(%q<rouge>.freeze, ["~> 4.0"])
    s.add_dependency(%q<thread_safe>.freeze, [">= 0"])
    s.add_dependency(%q<twitter_cldr>.freeze, [">= 6.6.0"])
    s.add_dependency(%q<uuidtools>.freeze, [">= 0"])
    s.add_dependency(%q<bigdecimal>.freeze, [">= 0"])
    s.add_dependency(%q<debug>.freeze, [">= 0"])
    s.add_dependency(%q<equivalent-xml>.freeze, ["~> 0.6"])
    s.add_dependency(%q<guard>.freeze, ["~> 2.14"])
    s.add_dependency(%q<guard-rspec>.freeze, ["~> 4.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.6"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 1"])
    s.add_dependency(%q<rubocop-performance>.freeze, [">= 0"])
    s.add_dependency(%q<sassc-embedded>.freeze, ["~> 1"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.15"])
    s.add_dependency(%q<timecop>.freeze, ["~> 0.9"])
    s.add_dependency(%q<canon>.freeze, [">= 0"])
  end
end
