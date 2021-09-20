require './lib/vendor'
require "pp"
require 'date'

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
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.map do |vendor|
      if vendor.check_stock(item) > 0
        vendor
      end
    end.compact
  end

  def total_inventory
    items_array = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if items_array.include?(item) == false
          items_array << item
        end
      end
    end
    inventory_hash = {}

    items_array.each do |item|
      inventory_hash[item] = {
        quantity: vendors_that_sell(item).sum {|vendor| vendor.check_stock(item)},
        vendors: vendors_that_sell(item)
        }
    end


  inventory_hash
end

def sorted_item_list
  items_array = []
  @vendors.each do |vendor|
    vendor.inventory.each do |item, quantity|
      if items_array.include?(item) == false
        items_array << item.name
      end
    end
  end
  items_array.uniq.sort
end

def date

end
end
