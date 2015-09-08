require 'ostruct'

module Catalog

  @products = {
      'FR1' => OpenStruct.new( code: 'FR1', name: 'Fruit tea', price:  311 ),
      'AP1' => OpenStruct.new( code: 'AP1', name: 'Apple',     price:  500 ),
      'CF1' => OpenStruct.new( code: 'CF1', name: 'Coffee',    price: 1123 )
    }

  def self.product(product_code)
    if @products.keys.include?(product_code)
      return @products[product_code]
    else
      return OpenStruct.new( code: 'N/A', name: "", price: 0)
    end
  end

end