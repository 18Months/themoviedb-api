# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "tmdb/version"

Gem::Specification.new do |s|
  s.name        = "tmdb"
  s.version     = Tmdb::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["18Months"]
  s.email       = ["dev@18months.it"]
  s.homepage    = "http://rubygems.org/gems/tmdb"
  s.summary     = %q{A simple to use Ruby wrapper for the The Movie Database API.}
  s.description = %q{Provides a simple and intuitive interface for the Movie Database API making use of OpenStruct.}
  s.rubyforge_project = "tmdb"

  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = %w[lib]

  s.add_runtime_dependency 'httparty',          '~> 0.13.5'
  s.add_runtime_dependency 'activesupport',     '~> 4.2.2'

  s.add_development_dependency 'awesome_print', '~> 1.6.1'
  s.add_development_dependency 'vcr',           '~> 2.9.3'
  s.add_development_dependency 'rake',          '~> 10.4.2'
  s.add_development_dependency 'rspec',         '~> 3.3.0'
  s.add_development_dependency 'webmock',       '~> 1.21.0'
end
