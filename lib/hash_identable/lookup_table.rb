require "active_support/inflector"

module HashIdentable

  def self.lookup_table
    @lookup_table ||= LookupTable.new
  end

  class LookupTable < Hash

    def fetch_id klass, &blk
      klass = klass.to_s
      begin
        return invert(klass)
      rescue
        return blk.call if block_given?
        return nil
      end
    end

    def fetch key, &blk
      begin
        return self[key].camelize
      rescue
        return blk.call if block_given?
        return nil
      end
    end

    def store key, klass
      klass = klass.to_s.underscore
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
