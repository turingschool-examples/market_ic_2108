class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name       = name
    @inventory  = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def include_inventory(item)
    @inventory.include?(item)
  end

  def potential_revenue
    inventory.sum do |item, price|
      cost = item.price.split('$').last.to_f
      cost * price
    end
  end
end
