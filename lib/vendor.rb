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

  def stock(item, quantity)
    @inventory[item] += quantity
  end

end
