class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if inventory[item].nil?
      0
    else
      inventory[item]
    end
  end

  def stock(item, quantity)
    inventory[item] = quantity
  end

  def potential_revenue
    sum = 0
    inventory.keys.zip(inventory.values) do |key, value|
      sum += key.price * value
    end
    sum
  end

  def items
    inventory.keys.map do |item|
      item.name
    end
  end
end
