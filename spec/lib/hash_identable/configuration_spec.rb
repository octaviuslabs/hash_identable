require 'spec_helper'
require 'hash_identable'

module HashIdentable
  module TestData
    class Foo; end
  end
  describe Configuration do
    subject(:config){ Configuration.new }

    describe "salt" do
      subject{ config.salt }
      context "with no salt configured" do
        it { expect{subject}.to raise_error "You must set the salt for the system" }
      end
      context "salt configured" do
        before{ config.set_salt "Salty Cookies" }
        it { is_expected.to eql "Salty Cookies" }
      end
    end

    describe "#set_salt" do
      subject do
        config.set_salt "the salt string"
      end
      it { is_expected.to eql "the salt string" }

    end

    describe "#add_object" do
      subject do
        config.add_object TestData::Foo, 3
      end
      it { is_expected.to be_truthy }
      it { subject; expect(TestData::Foo.included_modules).to include(HashIdentable)}
      it { expect{subject}.to change{HashIdentable::lookup_table.keys.count}.from(0).to(1) }

    end




  end

end
