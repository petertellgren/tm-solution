require 'forwardable'
class Basket
  extend Forwardable
  def_delegators :@items, :<<, :length, :each # and anything else

  def initialize(items = [])
    @items = items
  end

  def add(item)
    @items << item
  end

  def find(code)
    @items.select{ |item| item.code == code }
  end

  def item_count(code)
    self.find(code).count
  end

  def total
    @items.map(&:price).inject{|sum,x| sum + x } || 0
  end

end