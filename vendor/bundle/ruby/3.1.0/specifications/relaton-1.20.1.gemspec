# -*- encoding: utf-8 -*-
# stub: relaton 1.20.1 ruby lib

Gem::Specification.new do |s|
  s.name = "relaton".freeze
  s.version = "1.20.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.date = "2025-04-24"
  s.description = "  The Relaton core for importing, managing and caching bibliographic\nreferences to technical standards in the Relaton/XML bibliographic\nmodel.\n\nThis gem is in active development.\n".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.homepage = "https://github.com/relaton/relaton".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "The Relaton core for importing, managing and caching bibliographic references to technical standards.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<relaton-3gpp>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-bipm>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-bsi>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-calconnect>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-ccsds>.freeze, ["~> 1.20.2".freeze])
  s.add_runtime_dependency(%q<relaton-cen>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-cie>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-doi>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-ecma>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-etsi>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-gb>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-iana>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-iec>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-ieee>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-ietf>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-iho>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-isbn>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-iso>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-itu>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-jis>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-nist>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-oasis>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-ogc>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-omg>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-plateau>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-un>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-w3c>.freeze, ["~> 1.20.0".freeze])
  s.add_runtime_dependency(%q<relaton-xsf>.freeze, ["~> 1.20.0".freeze])
end
