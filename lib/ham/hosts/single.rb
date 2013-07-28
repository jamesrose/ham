module Ham
  class Hosts
    class Single
      include Hosts::Validator

      def initialize(address)        
        if valid_address?(address)
          @address = address
        else
          raise ArgumentError, "Invalid IP #{ip.inspect}"
        end
      end

      def each_host(&blk)
        yield @address
      end
    end
  end
end