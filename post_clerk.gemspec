# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name         = 'post_clerk'
  s.version      = "0.4"
  s.summary      = 'Calculate weight based charges for a OfficeClerk basket'
  s.description  = s.summary
  s.required_ruby_version = '>= 1.9.3'

  s.authors      = ['Torsten Rüger', 'Tobias Bohwalli']
  s.email        = ['torsten@villataika.fi', 'hi@futhr.io']
  s.homepage     = 'https://github.com/ruby_clerks/post_clerk'
  s.license      = 'MIT'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = false

  s.add_runtime_dependency 'office_clerk', '~> 0.8'

end
