require 'ham'

class SimpleScanner < Ham::Base

  def hosts
    '10.10.10.1/28' # Accepts a network w/ CIDR notation
    # Or a single address: 
    # '192.158.5.2'
    # Or an array of addresses:
    # ['174.44.12.1', '12.4.4.5']
  end

  def headers
    {
      'Referer' => 'http://www.google.com'
    }
  end

  def params
    { username: 'admin', password: 'admin' }
  end

  # Each host is passed into a +scan+ method.
  def scan(host)
    response = post("http://#{host}/path/to/app")
    if response
      puts 'Compromised!' if response.body.include?(params[:username])
    end
  end
end

SimpleScanner.scan!