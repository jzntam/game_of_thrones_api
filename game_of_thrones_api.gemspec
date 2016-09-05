# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'game_of_thrones_api/version'

Gem::Specification.new do |spec|
  spec.name          = "game_of_thrones_api"
  spec.version       = GameOfThronesApi::VERSION
  spec.authors       = ["Jason Tam"]
  spec.email         = ["jzntam@github.com"]

  spec.summary       = %q{Game of Thrones}
  spec.description   = %q{An API Of Ice And Fire.}
  spec.homepage      = "https://github.com/jzntam/game_of_thrones_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', '~> 0.13'
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
