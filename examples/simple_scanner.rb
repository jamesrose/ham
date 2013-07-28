require 'ham'

class SimpleScanner < Ham::Base

  # Set your target hosts here. It will accept a network address with CIDR
  # notation, a single address or an array of addresses.
  #
  # Example:
  #   '10.10.10.1/28'
  #   '192.158.5.2'
  #   ['174.44.12.1', '12.4.4.5']
  #
  def hosts
    '10.10.10.1/28'
  end

  # Set your HTTP headers here.
  def headers
    { 'Referer' => 'http://www.google.com' }
  end

  # Set your request parameters here.
  def params
    { username: 'admin', password: 'admin' }
  end

  # Each host is passed into a +scan+ method in your scanner. Here you make the
  # actual HTTP request. Your headers and parameters are injected automatically.
  #
  # Ham doesn't care what you do with the results of the request, but in this
  # instance we check to see if the username is included in the response body.
  def scan(host)
    response = post("http://#{host}/path/to/app")
    if response
      puts 'Compromised!' if response.body.include?(params[:username])
    end
  end
end

SimpleScanner.scan!
