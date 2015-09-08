require 'spec_helper'

describe 'BuyOneGetOne' do

  before(:each) do
    @bogo = BuyOneGetOne.new('AP1')
  end

  describe "#discount" do
    it '2 Apples discount is the price of 1' do
      @basket = Basket.new
      product = OpenStruct.new( code: 'AP1', price:  500 )
      2.times do
        @basket.add(product)
      end

      expect(@bogo.discount(@basket)).to equal( 500 )

    end

  end

end