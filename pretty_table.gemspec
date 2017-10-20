# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pretty_table/version'

Gem::Specification.new do |spec|
  spec.name          = 'pretty_table'
  spec.version       = PrettyTable::VERSION
  spec.author        = 'Peter Faiman'

  spec.summary       = 'Format arrays into ASCII tables.'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(?:test/|\.)})
  end
  spec.bindir        = 'exe'
  spec.executables   = ['pretty_table']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15.4'
  spec.add_development_dependency 'minitest', '~> 5.10.3'
  spec.add_development_dependency 'rake', '~> 12.1.0'
  spec.add_development_dependency 'rubocop', '~> 0.51.0'
end
