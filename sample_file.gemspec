# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sample_file/version'

Gem::Specification.new do |spec|
  spec.name          = "sample_file"
  spec.version       = SampleFile::VERSION
  spec.authors       = ["Maarten Claes"]
  spec.email         = ["maartencls@gmail.com"]
  spec.description   = %q{Sample files for testing purposes}
  spec.summary       = %q{Sample files for testing purposes}
  spec.homepage      = "https://github.com/mcls/sample_file"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "ruby-imagespec", "~> 0.3.1"
end
