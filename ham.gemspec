Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'ham'
  s.version = '0.0.1'
  s.summary = 'Ham'
  s.description = 'Ham ham ham ham!'
  s.author = 'James Rose'
  s.email = 'james@jbpr.net'
  s.files = Dir['examples/*/**', 'lib/*/**', 'bin/*']
  s.require_path = 'lib'
  s.post_install_message = 'Thanks for scanning with Ham :)'

  s.add_dependency 'httparty'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
end
