class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map{ |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    @vendors.select{ |vendor| vendor.inventory.keys.include?(item)}
  end

  def total_num_item(item)
    vendors_that_sell(item).sum do |vendor|
      vendor.inventory[item]
    end
  end

  def item_list
    @vendors.flat_map do | vendor |
      vendor.inventory.keys
    end.uniq
  end

  def sorted_item_list
    items = item_list

    items.sort_by!{ |item| item.name }
    
    items.map { |item| item.name }
  end

  def total_inventory
    item_list.to_h do | item |
      [item, {
        quantity: total_num_item(item),
        vendors: vendors_that_sell(item)
      }]
    end
  end

  def overstocked_items
    item_list.select do | item |
      vendors_that_sell(item).length > 1 && total_num_item(item) > 50
    end
  end
end