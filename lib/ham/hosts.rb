module Ham
  class Hosts
    def initialize(hosts)
      @hosts = hosts
      if hosts.is_a?(String)
        if hosts.include? '/'
          @klass = Ham::Hosts::Network
        else
          @klass = Ham::Hosts::Single
        end
      elsif hosts.is_a?(Array)
        @klass = Ham::Hosts::Multiple
      else
        raise ArgumentError, "Invalid host format: #{hosts.inspect}"
      end
    end

    def each_host(&blk)
      klass = @klass.new(@hosts)
      klass.each_host(&blk)
    end

    def self.parse(hosts, &blk)
      new(hosts).each_host(&blk)
    end
  end
end
