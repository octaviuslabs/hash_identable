require "rubygems"

module HashIdentable

  def self.lookup_table
    @lookup_table ||= LookupTable.new
  end

  class LookupTable < Hash

    def fetch_id klass, &blk
      yield blk unless has_value?(klass)
      return invert(klass)
    end

    def fetch key, &blk
      yield blk unless has_key?(key)
      return Object.const_get(self[key])
    end

    def store key, klass
      if has_key?(key)
        raise "Id's for objects must be unique"
      end
      if has_value?(klass)
        raise "Object is already registered"
      end
      super(key, klass)
    end

  end
end
