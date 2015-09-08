class VolumeRebate
  def initialize(code, quantity, rebate)
    @code     = code
    @quantity = quantity
    @rebate   = rebate
  end

  def discount(basket)
    discount = 0
    relevant_items = basket.find(@code)
    if relevant_items.count >= @quantity
      discount = (relevant_items.first.price / @rebate) * relevant_items.count
    end
    return discount
  end
end
