require 'spec_helper'
require 'hash_identable/identity'

module HashIdentable
  module TestStubs

    class ActiveRecordObject; end
    def self.decode key
      [3, 500]
    end
  end
  describe Identity do

    describe "class" do
      describe "#find" do
        subject do
          HshFunction.extend(TestStubs)
          HashIdentable.lookup_table.store(3, TestStubs::ActiveRecordObject.new.class)
          Identity.find("k54p36QKgnM7LbXGkLhr10EJ1WweRNr9ODx2")
        end
        it{ expect(subject.klass).to eql "HashIdentable::TestStubs::ActiveRecordObject" }
        it{ expect(subject.id).to eql 500 }
      end
    end

    describe "insance" do
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
          allow(obj).to receive(:hash_table_id) { 3 }
        end
        subject do
          obj.to_s
        end
        it { is_expected.to eql "k54p36QKgnM7LbXGkLhr10EJ1WweRNr9ODx2"} # from http://codepen.io/ivanakimov/pen/bNmExm
      end
    end
  end
end
