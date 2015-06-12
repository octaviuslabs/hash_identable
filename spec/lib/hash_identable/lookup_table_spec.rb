require 'spec_helper'
require 'hash_identable/lookup_table'

module HashIdentable
  describe LookupTable do
    subject(:table){ LookupTable.new }

    describe "adds object" do
      subject(:store){table.store(3, :first_test)}

      context "unique" do
        it { is_expected.to be_truthy }
        it { is_expected.to eql "first_test"}
      end

      context "existing key" do
        subject do
          table.store(3, :new_test)
          store
        end
        it { expect{subject}.to raise_error "Id's for objects must be unique" }
      end

      context "existing object" do
        subject do
          table.store(8, :first_test)
          store
        end
        it { expect{subject}.to raise_error "Object is already registered" }
      end

    end

  end

end
