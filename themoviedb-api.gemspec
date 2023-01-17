# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'tmdb/version'

Gem::Specification.new do |s|
  s.name        = 'themoviedb-api'
  s.version     = Tmdb::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['18Months']
  s.email       = ['dev@18months.it']
  s.homepage    = 'https://github.com/18Months/themoviedb-api'
  s.summary     = %q{A simple to use Ruby wrapper for the The Movie Database API.}
  s.description = %q{Provides a simple and intuitive interface for the Movie Database API making use of OpenStruct.}
  s.license     = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = %w[lib]

  s.add_runtime_dependency 'rest-client', '~> 2.1'

  s.add_development_dependency 'awesome_print', '~> 1.9'
  s.add_development_dependency 'vcr',           '~> 6.1'
  s.add_development_dependency 'rake',          '~> 13.0'
  s.add_development_dependency 'rspec',         '~> 3.12'
  s.add_development_dependency 'webmock',       '~> 3.18'
  s.add_development_dependency 'coveralls',     '~> 0.8'
  s.add_development_dependency 'json',          '>= 2.6.0', '< 3'
end
