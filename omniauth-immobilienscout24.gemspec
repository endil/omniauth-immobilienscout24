# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-immobilienscout24/version'

Gem::Specification.new do |s|
  s.name          = 'omniauth-immobilienscout24'
  s.version       = Omniauth::Immobilienscout24::VERSION
  s.authors       = ['Niels Richter']
  s.email         = ['niels@endil.de']
  s.description   = 'OmniAuth strategy for ImmobilienScout24'
  s.summary       = s.description
  s.homepage      = 'https://github.com/nlsrchtr/omniauth-immobilienscout24'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']
  
  s.add_dependency 'multi_json', '~> 1.3'
  s.add_runtime_dependency 'omniauth-oauth', '~> 1.0'
  
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rack-test'
end
