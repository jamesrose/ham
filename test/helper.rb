unless defined? Ham
  $:.unshift File.expand_path('../../lib', __FILE__)
  require 'ham'
end

require 'httparty'
require 'minitest/autorun'

class TestCase < MiniTest::Unit::TestCase
end
