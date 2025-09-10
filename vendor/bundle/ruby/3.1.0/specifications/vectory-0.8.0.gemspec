# -*- encoding: utf-8 -*-
# stub: vectory 0.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "vectory".freeze
  s.version = "0.8.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-06-03"
  s.description = "Vectory performs pairwise vector image conversions for common\nvector image formats, such as SVG, EMF, EPS and PS.\n".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["vectory".freeze]
  s.files = ["exe/vectory".freeze]
  s.homepage = "https://github.com/metanorma/vectory".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Pairwise vector image conversions.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<base64>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<emf2svg>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<image_size>.freeze, [">= 3.2.0".freeze])
  s.add_runtime_dependency(%q<marcel>.freeze, ["~> 1.0".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.14".freeze])
  s.add_runtime_dependency(%q<thor>.freeze, ["~> 1.0".freeze])
end
