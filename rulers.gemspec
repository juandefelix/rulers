# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rulers/version'

Gem::Specification.new do |spec|
  spec.name          = "rulers"
  spec.version       = Rulers::VERSION
  spec.authors       = ["Juan Ortiz"]
  spec.email         = ["juandefelix@yahoo.es"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{A Rack-based Web Framework}
  spec.description   = %q{A Rack-based Web Framework, but with extra awesome.}
  spec.homepage      = "http://www.juanortiz.net"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'test-unit'

  spec.add_runtime_dependency 'rest_client'
  # spec.add_runtime_dependency 'some_gem', '1.3.0'
  # spec.add_runtime_dependency 'other_gem', '>0.8.2'
  spec.add_runtime_dependency 'rack'
end


