# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "MagicViper/version"

Gem::Specification.new do |spec|
  spec.name          = "MagicViper"
  spec.version       = MagicViper::VERSION
  spec.authors       = ["Nilesh Agrawal"]
  spec.email         = ["nilesh.d.agrawal@gmail.com"]
  spec.summary       = %q{Generates Objective C files for Viper Module Initialization.}
  spec.description   = %q{Creates all the files and setup required for Viper Architecture in iOS.}
  spec.homepage      = "https://github.com/ndagrawal"
  spec.licenses      = "MIT"
  spec.files         = `git ls-files -z`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }  
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "thor", "~> 0.19.4"
end
