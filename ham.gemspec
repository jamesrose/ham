Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'ham'
  s.version = '0.0.3'
  s.summary = 'Ham'
  s.description = 'A web-application security scanner framework.'
  s.author = 'James Rose'
  s.email = 'james@jbpr.net'
  s.files = Dir['examples/*/**', 'lib/*/**', 'bin/*']
  s.require_path = 'lib'
  s.post_install_message = 'Thanks for scanning with Ham :)'

  s.add_dependency 'httparty'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
end
