require 'checkout/catalog'
require 'checkout/basket'
require 'checkout/rules/buy_one_get_one'
require 'checkout/rules/volume_rebate'

class Checkout

  def initialize(discount_rules = [])
    @basket = Basket.new
    @discount_rules = discount_rules
  end

  def scan(product_code)
    @basket.add Catalog.product(product_code)
  end

  def total
    discount = 0
    @discount_rules.each do |rule|
      discount += rule.discount(@basket)
    end
    total = @basket.total - discount
    "$#{total.to_f/100}"
  end

end