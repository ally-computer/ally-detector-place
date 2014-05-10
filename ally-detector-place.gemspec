# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ally/detector/place/version'

Gem::Specification.new do |spec|
  spec.name          = "ally-detector-place"
  spec.version       = Ally::Detector::Place::VERSION
  spec.authors       = ["Chad Barraford"]
  spec.email         = ["cbarraford@gmail.com"]
  spec.description   = %q{An ally detector plugin to detect a place in raw language}
  spec.summary       = %q{An ally detector plugin that finds a place in raw language}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ["lib"]

  spec.add_dependency 'ally'

  # development dependencies
  spec.add_development_dependency "bundler", "~> 1.3"
  %w( rake rspec rubocop ).each do |gem|
    spec.add_development_dependency gem
  end
end
