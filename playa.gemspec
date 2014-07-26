# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'playa'
  spec.version       = '0.0.3'
  spec.authors       = ['Gavin Laking']
  spec.email         = ['gavinlaking@gmail.com']
  spec.summary       = %q{Plays mp3s from a directory.}
  spec.description   = %q{An example app using Vedeu.}
  spec.homepage      = 'https://github.com/gavinlaking/playa'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',            '~> 1.6'
  spec.add_development_dependency 'guard',              '2.6.1'
  spec.add_development_dependency 'guard-minitest',     '2.3.1'
  spec.add_development_dependency 'minitest',           '5.4.0'
  spec.add_development_dependency 'minitest-reporters', '1.0.5'
  spec.add_development_dependency 'pry',                '0.10.0'
  spec.add_development_dependency 'rake',               '10.3.2'
  spec.add_development_dependency 'simplecov',          '0.9.0'

  spec.add_dependency 'audite',             '0.3.0'
  spec.add_dependency 'ruby-mp3info',       '0.8.4'
  spec.add_dependency 'vedeu',              '0.0.41'
end
