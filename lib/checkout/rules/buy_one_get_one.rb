class BuyOneGetOne
  def initialize(code)
    @code = code
  end

  def discount(basket)
    discount = 0
    relevant_items = basket.find(@code)
    quantity = relevant_items.count
    if quantity > 1
      multipier = quantity/2
      discount = relevant_items.first.price * multipier
    end
    return discount
  end
end