require 'httparty'

module Ham
  class Base

    # Returns an empty array of default hosts
    def hosts
      []
    end

    # Returns a block that yields user defined-hosts
    def each_host(&blk)
      Ham::Hosts.parse(hosts, &blk)
    end

    # Returns an empty hash of default headers
    def headers
      {}
    end

    # Returns an empty hash of default parameters
    def params
      {}
    end

    # Raises a NotImplementedError. You should inherit this class and implement
    # your own #scan method.
    def scan
      raise NotImplementedError, 'Please override #scan with your own method'
    end

    # Make a HTTP POST request to your host.
    #
    # Returns a HTTParty object
    def post(uri, options = {})
      HTTParty.post(uri, options.merge(headers: headers, body: params))
    end

    # Make a HTTP GET request to your host.
    #
    # Returns a HTTParty object
    def get(uri, options = {})
      HTTParty.get(uri, options.merge(headers: headers, body: params))
    end

    # Iterates over each host, applying the re-defined +scan+ method to it.
    #
    # Returns nil
    def self.scan!
      scanner = new
      threads = []
      scanner.each_host do |host|
        threads << Thread.new(host) do |host|
          scanner.send(:scan, host)
        end
      end
      threads.each(&:join)
    end
  end
end
