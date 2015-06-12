module HashIdentable

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def has_hashid(id)
      klass = self.to_s
      return HashIdentable::lookup_table.store(id, klass)
    end

  end

end
