class Vendor
  attr_reader :name,
              :inventory,
              :item,
              :quantity

  def initialize(name)
    @name = name
    @inventory = Hash.new
    @item = 0
    @quantity = quantity
  end

  def check_stock(item)
    @item
  end

  def stock(item, quantity)
    @inventory.store(item.name, quantity)
    @item += quantity
  end
end
