# -*- encoding: utf-8 -*-
# stub: word-to-markdown 1.1.9 ruby lib

Gem::Specification.new do |s|
  s.name = "word-to-markdown".freeze
  s.version = "1.1.9".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ben Balter".freeze]
  s.date = "2025-01-08"
  s.description = "Ruby Gem to convert Word documents to markdown.".freeze
  s.email = "ben.balter@github.com".freeze
  s.executables = ["w2m".freeze]
  s.files = ["bin/w2m".freeze]
  s.homepage = "https://github.com/benbalter/word-to-markdown".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.16".freeze
  s.summary = "Ruby Gem to convert Word documents to markdown".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<cliver>.freeze, ["~> 0.3".freeze])
  s.add_runtime_dependency(%q<descriptive_statistics>.freeze, ["~> 2.5".freeze])
  s.add_runtime_dependency(%q<nokogiri-styles>.freeze, ["~> 0.1".freeze])
  s.add_runtime_dependency(%q<premailer>.freeze, ["~> 1.8".freeze])
  s.add_runtime_dependency(%q<reverse_markdown>.freeze, [">= 1".freeze, "< 3".freeze])
  s.add_runtime_dependency(%q<sys-proctable>.freeze, ["~> 1.0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0".freeze])
  s.add_development_dependency(%q<mocha>.freeze, ["~> 1.1".freeze])
  s.add_development_dependency(%q<pry>.freeze, ["~> 0.10".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.0".freeze])
  s.add_development_dependency(%q<rubocop-minitest>.freeze, ["~> 0.3".freeze])
  s.add_development_dependency(%q<rubocop-performance>.freeze, ["~> 1.5".freeze])
  s.add_development_dependency(%q<shoulda>.freeze, ["~> 4.0".freeze])
end
