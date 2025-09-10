# -*- encoding: utf-8 -*-
# stub: fontist 1.21.4 ruby lib

Gem::Specification.new do |s|
  s.name = "fontist".freeze
  s.version = "1.21.4".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/fontist/fontist", "homepage_uri" => "https://github.com/fontist/fontist", "source_code_uri" => "https://github.com/fontist/fontist" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ribose Inc.".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-07-24"
  s.description = "Install openly-licensed fonts on Windows, Linux and Mac!".freeze
  s.email = ["open.source@ribose.com".freeze]
  s.executables = ["fontist".freeze]
  s.files = ["exe/fontist".freeze]
  s.homepage = "https://github.com/fontist/fontist".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.post_install_message = "Please run `fontist update` to fetch formulas.".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Install openly-licensed fonts on Windows, Linux and Mac!".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<down>.freeze, ["~> 5.0".freeze])
  s.add_runtime_dependency(%q<extract_ttc>.freeze, ["~> 0.1".freeze])
  s.add_runtime_dependency(%q<fuzzy_match>.freeze, ["~> 2.1".freeze])
  s.add_runtime_dependency(%q<json>.freeze, ["~> 2.0".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.0".freeze])
  s.add_runtime_dependency(%q<mime-types>.freeze, ["~> 3.0".freeze])
  s.add_runtime_dependency(%q<sys-uname>.freeze, ["~> 1.2".freeze])
  s.add_runtime_dependency(%q<thor>.freeze, ["~> 1.2".freeze, ">= 1.2.1".freeze])
  s.add_runtime_dependency(%q<git>.freeze, ["~> 1.0".freeze])
  s.add_runtime_dependency(%q<ttfunk>.freeze, ["~> 1.6".freeze])
  s.add_runtime_dependency(%q<plist>.freeze, ["~> 3.0".freeze])
  s.add_runtime_dependency(%q<excavate>.freeze, ["~> 0.3".freeze, ">= 0.3.4".freeze])
  s.add_runtime_dependency(%q<socksify>.freeze, ["~> 1.7".freeze])
  s.add_development_dependency(%q<pry>.freeze, ["~> 0.14".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 2.3".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<rspec-benchmark>.freeze, ["~> 0.6".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.22.1".freeze])
  s.add_development_dependency(%q<rubocop-rails>.freeze, ["~> 2.9".freeze])
  s.add_development_dependency(%q<rubocop-performance>.freeze, ["~> 1.10".freeze])
  s.add_development_dependency(%q<vcr>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<webmock>.freeze, [">= 0".freeze])
end
