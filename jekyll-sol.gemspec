# frozen_string_literal: true

require_relative 'lib/jekyll-sol/version'

Gem::Specification.new do |spec|
  spec.name = 'jekyll-sol'
  spec.version = JekyllSol::VERSION
  spec.authors = ['Łukasz Biel']
  spec.email = ['lukasz.p.biel@gmail.com']

  spec.summary = 'Merge many blogs into one'
  spec.homepage = 'https://github.com/luke-biel/jekyll-sol'
  spec.license = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'jekyll', '~> 4.0.0'
  spec.add_runtime_dependency 'pluto-models', '~> 1.6.2'
  spec.add_runtime_dependency 'sqlite3', '~> 1.4.2'
  spec.add_runtime_dependency 'liquid', '~> 4.0.3'
end
