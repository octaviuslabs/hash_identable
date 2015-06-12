require 'spec_helper'
require 'hash_identable'

module HashIdentable
  module TestStub
    Identity = Struct.new(:id) do
      def encoded_id
        "k54p36QKgnM7LbXGkLhr10EJ1WweRNr9ODx2"
      end
    end

    def identity
      Identity.new(1)
    end

  end

  describe HashIdentable do
    subject(:obj)do
      obj = instance_double("ActiveRecordObject")
      allow(obj).to receive(:id){ 500 }
      obj.extend(HashIdentable)
      obj
    end

    it { is_expected.to respond_to(:uuid) }
    it { is_expected.to respond_to(:identity) }
    describe "#identity" do
      subject{ obj.identity }
      it { is_expected.to be_a Identity }
      it { expect(subject.id).to eql 500 }
    end

    describe "#uuid" do
      subject do
        obj.extend(TestStub)
        obj.uuid
      end
      it { is_expected.to be_a String }
      it { is_expected.to eql "k54p36QKgnM7LbXGkLhr10EJ1WweRNr9ODx2" }
    end

  end
end
