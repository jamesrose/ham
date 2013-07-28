require 'helper'

class TestNetwork < TestCase

  def setup
    @address = Ham::Hosts::Network.new('172.16.10.1/24')
    @decimal_values = {
      "0.0.0.0"        => 0,
      "10.0.0.0"       => 167772160,
      "172.16.0.0"    => 2886729728
    }
    @prefix_values = {
      0  => 0,
      8  => 4278190080,
      16 => 4294901760,
      24 => 4294967040,
      30 => 4294967292
    }
  end

  def test_address_u32
  end
  
  def test_prefix_u32
    @prefix_values.each do |num, u32|
      assert_equal u32, Ham::Hosts::Network.new("192.168.1.1/#{num}").prefix_u32
    end
  end

  def test_network_u32
    assert_equal 2886732288, @address.network_u32
  end
  
  def test_broadcast_u32
    assert_equal 2886732543, @address.broadcast_u32
  end

  def test_parse_u32
    @decimal_values.each do |addr, int|
      ip = @address.parse_u32(int)
      assert_equal ip, addr
    end
  end
end