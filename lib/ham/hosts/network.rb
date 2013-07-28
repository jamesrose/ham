module Ham
  class Hosts
    class Network
      include Hosts::Validator

      def initialize(address_and_prefix)
        address, prefix = address_and_prefix.split('/')
        prefix = prefix.to_i

        if valid_address?(address)
          @address = address
        else
          raise ArgumentError, "Invalid IP #{ip.inspect}"
        end

        if valid_prefix?(prefix)
          @prefix = prefix
        else
          raise ArgumentError, "Invalid CIDR #{prefix.inspect}"
        end
      end

      # Returns the network address as an unsigned 32-bit number
      def address_u32
        octets = @address.split('.').map(&:to_i)
        (octets[0] << 24) + (octets[1] << 16) + (octets[2] << 8) + (octets[3])
      end

      # Returns the prefix as an unsigned 32-bit number
      def prefix_u32
        (0xffffffff >> (32 - @prefix) << (32 - @prefix))
      end

      # Returns the network address as an unsigned 32-bit number
      def network_u32
        address_u32 & prefix_u32
      end

      # Returns the broadcast address as an unsigned 32-bit number
      def broadcast_u32
        network_u32 + ((2 ** (32 - @prefix)) - 1)
      end

      # Returns a normal address from a 32-bit address
      def parse_u32(u32)
        [u32].pack('N').unpack('C4').join('.')
      end

      # Itereates over all the hosts for a given network
      def each_host(&blk)
        (network_u32+1..broadcast_u32-1).each do |i|
          yield parse_u32(i)
        end
      end
    end
  end
end
