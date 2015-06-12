require 'spec_helper'
require 'hash_identable'

module HashIdentable
  module TestData
    class TestObject
      include HashIdentable
      attr_reader :id
    end

  end

  describe HashIdentable do
    subject(:klass) { TestData::TestObject }
    it { is_expected.to respond_to :has_hashid}
    it "should respond to locate_by_hash_id"

    describe "#has_hashid" do
      subject do
        klass.has_hashid(3)
      end
      it { expect{subject}.to change{HashIdentable::lookup_table.keys.count}.from(0).to(1) }
      it { expect(subject).to eql "hash_identable/test_data/test_object" }
    end

  end

end
