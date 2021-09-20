require './lib/item'

class Vendor

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.keys.none?(item)
      0
    else
      @inventory[item]
    end
  end

  def stock(item, quantity)
    @inventory[item] = (check_stock(item) + (quantity))
  end
end
