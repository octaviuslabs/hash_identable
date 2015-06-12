require "hash_identable/version"
require "hash_identable/class_methods"
require "hash_identable/configuration"
require "hash_identable/lookup_table"
require "hash_identable/exceptions"
require "hash_identable/identity"

module HashIdentable

  def identity
    @identity ||= Identity.new(self.class, id)
  end

  def uuid
    identity.encoded_id
  end

end
