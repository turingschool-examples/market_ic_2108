class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    vendors << vendor
  end

  def vendor_names
    vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendors.find_all { |vendor| vendor.inventory.include?(item) }
  end

  def sorted_item_list
    item_list = vendors.map do |vendor|
      vendor.items
    end.flatten.uniq
    item_list.sort
  end

  def total_inventory
    full_inventory = {}
    all_items.each do |item|
      vendors.each do |vendor|
        if full_inventory[item].nil?
          quantity = vendor.inventory[item]
          full_inventory[item] = {
          quantity: quantity,
          vendors: [vendor]
          }
        else
          quantity = vendor.inventory[item]
          if quantity != nil
            full_inventory[item][:quantity] += quantity
            full_inventory[item][:vendors] << vendor
          end
        end
      end
    end
  end

  def all_items
    vendors.map do |vendor|
      vendor.inventory.keys
    end.flatten.uniq
  end

  # def overstocked_items
  # end
end
