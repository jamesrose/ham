module Ham
  class Hosts
    class Multiple
      include Hosts::Validator

      def initialize(addresses)
        @addresses = addresses
        @addresses.each do |address|
          if not valid_address?(address)
            raise ArgumentError, "Invalid IP #{address.inspect}"
          end
        end
      end

      def each_host(&blk)
        @addresses.each do |address|
          yield address
        end
      end
    end
  end
end