require 'bundler/gem_tasks'

task :test do
  $:.unshift './test'
  Dir.glob('test/test_*.rb').each { |t| require File.basename(t) }
end