# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hash_identable/version'

Gem::Specification.new do |spec|
  spec.name          = "hash_identable"
  spec.version       = HashIdentable::VERSION
  spec.authors       = ["Jimi Smoot"]
  spec.email         = ["jsfour@gmail.com"]
  spec.summary       = %q{An easy uuid wrapper for rails applications}
  spec.description   = %q{An easy uuid wrapper for rails applications}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "hashids"
  spec.add_runtime_dependency "hashie"
  spec.add_runtime_dependency "simplecov"
end
