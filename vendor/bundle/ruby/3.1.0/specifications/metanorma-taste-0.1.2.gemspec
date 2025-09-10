# -*- encoding: utf-8 -*-
# stub: metanorma-taste 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "metanorma-taste".freeze
  s.version = "0.1.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/metanorma/metanorma-taste/issues", "homepage_uri" => "https://github.com/metanorma/metanorma-taste", "source_code_uri" => "https://github.com/metanorma/metanorma-taste" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.date = "2025-07-23"
  s.description = "Library to process and handle default Metanorma Tastes, providing configuration-driven customization of Metanorma flavours.".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.extra_rdoc_files = ["README.adoc".freeze, "LICENSE.txt".freeze]
  s.files = ["LICENSE.txt".freeze, "README.adoc".freeze]
  s.homepage = "https://github.com/metanorma/metanorma-taste".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.1.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Metanorma Taste Library".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<lutaml-model>.freeze, ["~> 0.7".freeze])
end
