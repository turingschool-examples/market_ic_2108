class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name    = name
    @vendors = []
  end

  def add_vendor(vendor_names)
    @vendors << vendor_names
  end

  def vendors_that_sell
    items_in_stock = @vendors.map do |vendor|
      vendor.stocked
    end
    vendors_items = {}
    items_in_stock.each do |item|
      item.each do |item_name, item_amount|
        if !vendors_items[item_name]
          vendors_items[item_name] = item_amount
        else
          vendors_items[item_name] += item_amount
        end
      end
    end
    vendors_items
  end

  def potential_revenue
    @vendors.sum do |vendor| item.potential_revenue
  end
end


# The Market will need to keep track of its
#  Vendors and their Items. Each Vendor will be
#  able to report its total inventory, stock i
#  tems, and return the quantity of items. Any
#  item not in stock should return `0` by default.
