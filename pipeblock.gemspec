# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pipeblock/version'

Gem::Specification.new do |spec|
  spec.name          = "pipeblock"
  spec.version       = Pipeblock::VERSION
  spec.authors       = ["André Stephano"]
  spec.email         = ["andrestephano@gmail.com"]

  spec.summary       = %q{Pipeoperator from Functional Programming goes to Ruby.}
  spec.description   = %q{This project was created to improve code reading by passing the return method of a function as the first argument of the next inside a pipe block.}
  spec.homepage      = "https://github.com/andrelip/pipeblock"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
