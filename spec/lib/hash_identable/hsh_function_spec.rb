require 'spec_helper'
require 'hash_identable/hsh_function'

module HashIdentable
  module HshFunction
    def self.salt
      "this is my salt"
    end
  end
  describe HshFunction do
    describe "#decode" do
      subject{ HshFunction.decode "k54p36QKgnM7LbXGkLhr10EJ1WweRNr9ODx2" }
      it{ is_expected.to eql [3, 500]}
    end

    describe "#encode" do
      subject{ HshFunction.encode [3, 500] }
      it { is_expected.to eql "k54p36QKgnM7LbXGkLhr10EJ1WweRNr9ODx2"}
    end
  end
end
