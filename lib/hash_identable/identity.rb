require "hash_identable/exceptions"
require "hash_identable/hsh_function"

module HashIdentable

  class Identity
    attr_reader :klass, :id

    def initialize klass, id
      @klass = klass
      @id = id
    end

    def to_s
      encoded_id.to_s
    end

    def hash_table_id
      @hash_table_id ||= HashIdentable.lookup_table.fetch_id(klass){ raise NoObjectRegistered, "No object registered" }
    end

    def hash_key
      raise "An ID is required to build a #hash_key" if id.nil? or klass.nil?
      return [hash_table_id, id]
    end

    def encoded_id
      id_wrapper.encode(hash_key)
    end

    def to_h
      {
        klass: klass,
        id: id,
        encoded_id: encoded_id
      }
    end

    def klass_constant
      klass.constantize
    end

    def self.find(encoded_id)
      decoded = HshFunction.decode(encoded_id)
      klass = HashIdentable.lookup_table.fetch(decoded[0]){ raise NoObjectRegistered, "No object registered" }
      new klass, decoded[1]
    end

  private

    def id_wrapper
      HshFunction
    end

  end

end
