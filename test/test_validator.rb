require 'helper'

class TestValidator < TestCase

  include Ham::Hosts::Validator

  def test_valid_address?
    assert valid_address?('192.168.1.1')
    assert valid_address?('10.10.10.10')
    assert !valid_address?('192.168.1.x')
    assert !valid_address?('196.168.1')
    assert !valid_address?('196.168')
    assert !valid_address?('441.168.1.1')
    assert !valid_address?('10.10.10.10/40') 
  end

  def test_valid_prefix?
    assert valid_prefix?(0)
    assert valid_prefix?(15)
    assert valid_prefix?(32)
    assert !valid_prefix?(-1)
    assert !valid_prefix?(35)
    assert !valid_prefix?('a')
  end
end