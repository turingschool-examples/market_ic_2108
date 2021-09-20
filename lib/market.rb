require './lib/vendor'
require './lib/item'

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

  def vendors_names
    names = []
    @vendors.each do |vendor|
      names << vendor.name
    end
    names
  end

  def vendors_that_sell(item)
    vts = []
    @vendors.each do |vendor|
      if vendor.check_stock(item) > 0
        vts << vendor
      end
    end
    vts
  end

  def all_items
    #helper method, in progress
  end

  def sorted_item_list
    #in progress
  end

  # def total_inventory
  #   ai = {}
  #   @vendors.each do |vendor|
  #     @inventory[item]
  #       ai << vendor.inventory
  #     end
  #   end

  def overstocked_items
    #in progress
  end
end
