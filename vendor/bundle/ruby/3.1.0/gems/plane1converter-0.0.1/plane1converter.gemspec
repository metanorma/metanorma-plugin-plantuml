# coding: utf-8
  
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "plane1converter/version"

Gem::Specification.new do |spec|
  spec.name          = "plane1converter"
  spec.version       = Plane1Converter::VERSION
  spec.authors       = ["Ribose Inc."]
  spec.email         = ["open.source@ribose.com"]

  spec.summary       = "Convert characters + font shifts to Plane 1 Mathematical Alphanumeric Symbols"
  spec.description   = <<~DESCRIPTION
    Convert characters + font shifts to Plane 1 Mathematical Alphanumeric Symbols
  DESCRIPTION

  spec.homepage      = "https://github.com/plurimath/plane1converter"
  spec.license       = "BSD-2-Clause"

  spec.bindir        = "bin"
  spec.require_paths = ["lib"]
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {spec}/*`.split("\n")
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "byebug", "~> 9.1"
  spec.add_development_dependency "rspec-match_fuzzy", "~> 0.1.3"
  spec.add_development_dependency "guard", "~> 2.14"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.6"
  spec.add_development_dependency "rubocop", "= 0.54.0"
  spec.add_development_dependency "simplecov", "~> 0.15"
  spec.add_development_dependency "timecop", "~> 0.9"
end

