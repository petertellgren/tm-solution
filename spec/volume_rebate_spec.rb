require 'spec_helper'

describe 'VolumeRebate' do

  before(:each) do
    @vr = VolumeRebate.new('AP1', 3, 10)
  end

  describe "#discount" do
    it '4 Apples ammounts to 200 cents discount' do
      @basket = Basket.new
      product = OpenStruct.new( code: 'AP1', price:  500 )
      4.times do
        @basket.add(product)
      end

      expect(@vr.discount(@basket)).to equal( 200 )

    end

  end

end