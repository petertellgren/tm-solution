require 'spec_helper'

describe 'Basket' do

  before(:each) do
    @basket = Basket.new() #@one_tea_for_free, @volume_apples
    @tea   = OpenStruct.new( code: 'FR1', price:  311 )
    @apple = OpenStruct.new( code: 'AP1', price:  500 )
  end

  describe '#add' do
    it 'inserts an item from catalog the basket' do
      3.times { @basket.add( @tea ) }

      expect( @basket.length ).to eq( 3 )
    end
  end

  describe '#total' do
    it 'returns the total value of the basket items without any discounts' do
      4.times { @basket.add(@apple) }

      expect(@basket.total).to eq( 4 * @apple.price ) # 500*4 = 2000
    end
  end

  describe '#find' do
    it 'returns all the items that match the item code' do
      3.times { @basket.add( @tea ) }
      2.times { @basket.add( @apple ) }

      expect( @basket.find(@tea.code).length ).to eq( 3 )
    end
  end

end