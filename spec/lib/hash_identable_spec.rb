require 'spec_helper'
require 'hash_identable'

module HashIdentable
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
    it "should pull data from the task log uuid and convert it to uuids"

  end
end
