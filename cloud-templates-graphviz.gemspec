Gem::Specification.new do |s|
  s.name        = 'cloud-templates-graphviz'
  s.version     = '0.1.0'
  s.license     = 'Apache 2.0'
  s.summary     = 'GraphViz render for cloud-templates-ruby.'
  s.description = 'Generates visual representation for arbitrary model.'
  s.authors     = ['Ivan Matylitski', 'Ade Teriba']
  s.email       = ['buffovich@gmail.com', 'adekunleteriba@hotmail.com']
  s.files       = Dir['lib/**/*'] +
                  Dir['spec/**/*'] +
                  [
                    'LICENSE', 'Gemfile', 'NOTICE', 'README.md', 'Rakefile',
                    '.rubocop.yml', '.simplecov', 'cloud-templates.gemspec',
                    '.rspec'
                  ]
  s.test_files = Dir['spec/**/*']
  s.homepage    = 'https://rubygems.org/gems/cloud-templates-graphviz'
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0")
  s.add_dependency('cloud-templates', '>=0.4.0', '~> 0.4')
  s.add_dependency('gv', '>=0.1.0', '~> 0.1')
  s.add_dependency('eslintrb', '>=2.1', '~> 2.1')
  s.add_dependency('execjs', '>=2.7.0', '~> 2.7')
  s.add_dependency('therubyracer', '>=0.12.3', '~> 0.12.3')
  s.add_dependency('nokogiri', '>= 1.10', '>= 1.10.4')
  s.add_development_dependency('rake', '>=12.3.0', '~>12.3')
  s.add_development_dependency('concourse', '~> 0.28.0')
  s.add_development_dependency('hoe', '~> 3.18')
  s.add_development_dependency('hoe-bundler', '~> 1.5')
  s.add_development_dependency('hoe-debugging', '~> 2.0')
  s.add_development_dependency('hoe-gemspec', '~> 1.0')
  s.add_development_dependency('hoe-git', '~> 1.6')
  s.add_development_dependency('minitest', '~> 5.11', '>= 5.11.3')
  s.add_development_dependency('rspec', '>= 3.2', '~> 3')
  s.add_development_dependency('racc', '~> 1.4', '>= 1.4.15')
  s.add_development_dependency('rake-compiler', '~> 1.0', '>= 1.0.7')
  s.add_development_dependency('rake-compiler-dock', '~> 0.7.2')
  s.add_development_dependency('rdoc', '~> 6.1', '>= 6.1.1')
  s.add_development_dependency('rexical', '~> 1.0', '>= 1.0.7')
  s.add_development_dependency('rubocop', '~> 0.50')
  s.add_development_dependency('ref', '~> 2.0')
  s.add_development_dependency('rubocop-rspec', '~> 1.17')
  s.add_development_dependency('byebug', '>= 9.0.5', '~> 9')
  s.add_development_dependency('yard', '~> 0.9')
  s.add_development_dependency('simplecov', '~> 0.14')
  s.add_development_dependency('multi_json', '~> 1.13', '>= 1.13.1')
  s.add_development_dependency('execjs', '~> 2.7')
  s.add_development_dependency('bump', '~> 0.8.0')
  s.add_development_dependency('submodule', '~> 0.1.1')
end
