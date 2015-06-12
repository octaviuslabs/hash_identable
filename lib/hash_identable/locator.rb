require "hash_identable/identity"

module HashIdentable
  module Locator
    def self.find(key, find_method=:find)
      identity = Identity.find(key)
      return identity.klass_constant.send(find_method, identity.id)
    end

    module ActiveRecord

      def self.find(key)
        HashIdentable::Locator.find(key, :find)
      end

    end
  end
end
