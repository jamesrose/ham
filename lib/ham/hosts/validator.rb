module Ham
  class Hosts
    module Validator
      def valid_address?(address)
        if /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\Z/ =~ address
          return $~.captures.all? {|i| i.to_i < 256}
        end
        false
      end

      def valid_prefix?(prefix)
        (0..32).include?(prefix)
      end
    end
  end
end