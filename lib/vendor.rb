class Vendor
  attr_reader :name,
              :inventory,
              :item,
              :quantity

  def initialize(name)
    @name = name
    @inventory = Hash.new
    @item = item
    @quantity = quantity
  end

  def check_stock(item)
    @item = 0
  end

  def stock(item, quantity)
    @inventory.store(item.name, quantity)
  end
end
