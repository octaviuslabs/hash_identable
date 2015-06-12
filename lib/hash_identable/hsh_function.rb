require "hashids"

module HashIdentable
  module HshFunction

    def self.hashing_object
      @hashing_object ||= Hashids.new(salt, hash_length)
    end

    def self.encode key
      hashing_object.encode key
    end

    def self.decode item
      hashing_object.decode item
    end

  private
    def self.salt
      @salt ||= HashIdentable.configuration.salt
    end

    def self.hash_length
      @hash_length ||= HashIdentable.configuration.hash_length
    end

  end
end
