require './lib/item'

class Vendor
  attr_reader :name,
              :inventory,
              :item,
              :item_count,
              :price,
              :item_info,
              :stock_hash

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    item = item
    item_count = item_count.to_i
    stock_hash = {item: item, item_count: item_count}
    stock_hash[:item_count]
  end

  def stock(item, item_count)
    item = item
    item_count = item_count.to_i
    stock_hash = {item: item, item_count: item_count}
    stock_hash << @inventory
  end
end
