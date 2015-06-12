require 'spec_helper'
require 'hash_identable/identity'

module HashIdentable
  describe Identity do
    let(:klass){ double("ActiveRecordModel") }
    subject(:obj) do
      Identity.new("ActiveRecordModel", 500)
    end

    describe "hash_key" do
      subject do
        obj.hash_key
      end

      context "has id" do
        before do
          allow(obj).to receive(:hash_table_id) { 3 }
        end
        it{ is_expected.to eql [3, 500]}
      end

      context "no id" do
        before do
          allow(obj).to receive(:hash_table_id) { 3 }
          allow(obj).to receive(:id) { nil }
        end
        it{ expect{subject}.to raise_error "An ID is required to build a #hash_key"}
      end
    end

    describe "#to_s" do
      before do
        allow(obj).to receive(:salt) { "this is my salt" }
        allow(obj).to receive(:hash_table_id) { 3 }
      end
      subject do
        obj.to_s
      end
      it { is_expected.to eql "k54p36QKgnM7LbXGkLhr10EJ1WweRNr9ODx2"} # from http://codepen.io/ivanakimov/pen/bNmExm
    end

  end
end
