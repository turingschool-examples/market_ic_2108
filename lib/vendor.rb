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

  def potential_revenue
    pv = 0
    @inventory.each do |k , v|
      pv += (k.data[:price].delete_prefix("$").to_f * v)
    end
    pv.round(2)
  end
end
