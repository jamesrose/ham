require 'helper'

class TestBase < TestCase

  def setup
    @base = Ham::Base.new
  end

  def test_default_hosts
    assert_equal [], @base.hosts
  end

  def test_default_headers
    assert_equal({}, @base.headers)
  end

  def test_default_params
    assert_equal({}, @base.params)
  end

  def test_scan_raises
    assert_raises(NotImplementedError) do
      @base.scan
    end
  end

  def test_post_returns_httparty
    assert_equal HTTParty::Response, @base.post('http://www.google.com').class
  end

  def test_post_includes_headers
    assert_equal({}, @base.headers)
  end

  def test_post_includes_params
    assert_equal({}, @base.params)
  end

  def test_get_returns_httparty
    assert_equal HTTParty::Response, @base.post('http://www.google.com').class
  end

  def test_get_includes_headers
    assert_equal({}, @base.headers)
  end

  def test_get_includes_params
    assert_equal({}, @base.params)
  end
end
