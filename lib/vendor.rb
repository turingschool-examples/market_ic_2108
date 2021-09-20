class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    item.stock
  end

  def stock(item, amount)
    item.change_stock(amount)
    @inventory[item] = item.stock
  end

  def potential_revenue
    @inventory.sum do |item, quantity|
      item.price * quantity
    end
  end
end
