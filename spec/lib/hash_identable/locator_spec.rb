require 'spec_helper'
require 'hash_identable/locator'

module HashIdentable
  module Locator
    module TestData
      class Tobj
        attr_reader :id
        include HashIdentable

        def self.find(id)
          return new
        end
      end

      class Obj1 < Tobj; end
      class Obj2 < Tobj; end
      class Obj3 < Tobj; end
    end

    shared_examples "a found object" do
      let(:obj1) { TestData::Obj1 }
      let(:obj2) { TestData::Obj2 }
      let(:obj3) { TestData::Obj3 }
      let(:objs) do
        obj_klass = [obj1, obj2, obj3]
        objs = Array.new
        obj_klass.each_with_index do |obj, i|
          obj.has_hashid(100+Random.rand(1000))
          obj = obj.new
          allow(obj).to receive(:id){ i }
          objs << obj
        end
        objs
      end
      it { is_expected.to be_truthy }
      it { is_expected.to be_a TestData::Obj1 }
    end

    describe "#find" do
      subject do
        obj = objs[0]
        allow(Identity).to receive(:find){ Identity.new(obj.class.to_s, obj.id) }
        Locator.find(3, :find)
      end
      it_should_behave_like "a found object"
    end

    module ActiveRecord
      describe "#find" do
        subject do
          obj = objs[0]
          allow(Identity).to receive(:find){ Identity.new(obj.class.to_s, obj.id) }
          ActiveRecord.find(3)
        end
        it_should_behave_like "a found object"
      end
    end
  end
end
