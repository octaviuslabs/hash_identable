require "hashids"
require "hash_identable/exceptions"

module HashIdentable

  class Identity
    attr_reader :klass, :id

    def initialize klass, id
      @klass = klass
      @id = id
    end

    def to_s
      hash_id.to_s
    end

    def hash_table_id
      @hash_table_id ||= HashIdentable.lookup_table.fetch_id(klass){ raise NoObjectRegistered, "No object registered" }
    end

    def hash_key
      raise "An ID is required to build a #hash_key" if id.nil? or klass.nil?
      return [hash_table_id, id]
    end

    def hash_id
      hashids = Hashids.new(salt, 36)
      hashids.encode(hash_key)
    end
    alias_method :encoded, :hash_id

  private
    def salt
      @salt ||= HashIdentable.configuration.salt
    end

  end

end
