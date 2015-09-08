require 'spec_helper'

describe 'Catalog' do

  describe '#product' do
    it 'returns a product from the catalog' do
      expect( Catalog.product('AP1') ).to eq( OpenStruct.new( code: 'AP1', name: 'Apple', price:  500 ) )
    end

    it 'returns a null Product from the catalog if product does not exsist' do
      expect( Catalog.product('AP2') ).to eq( OpenStruct.new( code: 'N/A', name: "", price: 0) )
    end
  end

end