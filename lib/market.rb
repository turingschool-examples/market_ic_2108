class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name     = name
    @vendors  = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.check_stock(item) != 0
    end
  end

  def sorted_item_list
    items = @vendors.map do |vendor|
      vendor.inventory.keys.map do |key|
        key.name
      end
    end.flatten.uniq

    items.sort
  end

  def items_in_market
    hash = {}

    @vendors.each do |vendor|
      hash = hash.merge(vendor.inventory) {|key, val1, val2| val1 + val2}
    end
    hash
  end

  def total_inventory
    hash = {}
    items = items_in_market

    items.keys.each do |item|
      if !hash[item]
        hash[item] = {quantity: items_in_market[item], vendors: vendors_that_sell(item)}
      else
        hash[item] += {quantity: items_in_market[item], vendors: vendors_that_sell(item)}
      end
    end
    hash
  end

  def overstocked_items
    items_in_market.keys.find_all do |item|
      items_in_market[item] >= 50 && vendors_that_sell(item).length > 1
    end
  end
end
