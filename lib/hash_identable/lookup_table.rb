require "active_support/inflector"

module HashIdentable

  def self.lookup_table
    @lookup_table ||= LookupTable.new
  end

  class LookupTable < Hash

    def fetch_id klass, &blk
      begin
        klass = serialzie(klass)
        return invert[klass]
      rescue
        return blk.call if block_given?
        return nil
      end
    end

    def fetch key, &blk
      begin
        return de_serialize(self[key])
      rescue
        return blk.call if block_given?
        return nil
      end
    end

    def store key, klass
      klass = serialzie(klass)
      if has_key?(key)
        raise "Id's for objects must be unique"
      end
      if has_value?(klass)
        raise "Object is already registered"
      end
      super(key, klass)
    end

  private
    def serialzie klass
      klass.to_s.underscore
    end

    def de_serialize klass
      klass.to_s.camelize
    end

  end
end
