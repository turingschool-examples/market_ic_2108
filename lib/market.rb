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
    @vendors.filter_map do |vendor|
      vendor if vendor.include_inventory(item)
    end
  end

  # this took me too long because I assumed they would be in order of 1,2,3,4
  def total_inventory
    totes_hash = {}
    vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if totes_hash[item].nil?
          totes_hash[item] = { quantity: quantity, vendors: [vendor] }
        else
          totes_hash[item][:quantity] += quantity
          totes_hash[item][:vendors] << vendor
        end
      end
    end
    totes_hash
  end

  def overstocked_items
    total_inventory.filter_map do |key, value|
      key if value[:quantity] > 50 && value[:vendors].count > 1
    end
  end

  def sorted_item_list
    vendors.flat_map do |vendor|
      vendor.inventory.map do |item, _quantity|
        item.name
      end
    end.sort.uniq
  end

  def date
    Date.today.strftime("%d/%m/%Y")
  end

#   def sell(item, amount)
#     total_inventory.filter_map do |key, value|
#       # require "pry"; binding.pry
#       if key != item
#         false
#       elsif key == item
#         (value[:quantity] < amount)
#         return false
#       else
#         key == item
#         value[:quantity] -= amount
#       end
#       # require "pry"; binding.pry
#     end
#   end
end
