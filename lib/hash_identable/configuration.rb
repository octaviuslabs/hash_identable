module HashIdentable

  def self.config
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  class Configuration

    def initialize
      @hash_length = 36
    end

    def salt
      return @salt unless @salt.nil?
      raise "You must set the salt for the system"
    end


    def hash_length
      return @hash_length unless @hash_length.nil?
      raise "You must set the hash_length for the system"
    end

    def set_salt(new_salt)
      @salt = new_salt
    end

    def set_length(length_of_string)
      @hash_length = length_of_string
    end

  end

end
