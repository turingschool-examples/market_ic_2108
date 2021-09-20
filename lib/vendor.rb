require './lib/item'

class Vendor

  attr_reader :name, :inventory

  def initialize (name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if inventory.keys.include?(item)
      return inventory[item]
    else
      return 0
    end
  end

  def stock(item_name, item_count)
    if inventory.keys.include?(item_name)
      inventory[item_name] += item_count
    else
      inventory[item_name] = item_count
    end
  end

  def potential_revenue
    @inventory.sum do |item_name, item_count|
      item_count * item_name.price
    end
  end

end
