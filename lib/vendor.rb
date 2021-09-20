# Vendor creates a vendor class that holds inventory

class Vendor

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, quantity)
    if @inventory[item].nil?
      @inventory[item] = quantity
    else
      @inventory[item] += quantity
    end
  end

  def check_stock(item)
    if @inventory[item].nil?
      0
    else
      @inventory[item]
    end
  end

  def potential_revenue
    pot_rev = 0
    @inventory.each { |item, quantity| pot_rev += (item.price * quantity.to_f) }
    pot_rev.round(2)
  end
end
