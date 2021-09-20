require './lib/item'
require './lib/vendor'

class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    name_array = []
    @vendors.each do |vendor|
      name_array << vendor.name
    end
    name_array
  end

  def vendors_that_sell(item_name)
    vendor_array = []
    @vendors.each do |vendor|
      if vendor.inventory.keys.include?(item_name)
        vendor_array << vendor
      end
    end
    vendor_array
  end

  def sorted_item_list
    item_name_array = []

    @vendors.each do |vendor|
require 'pry';binding.pry
      item_name_array << vendor.inventory.keys
    end

    fixed_item_name_array = item_name_array.flatten.uniq
    fixed_item_name_array.sort!
  end

  #
  # def total_inventory
  #   outer_hash = {}
  #   inner_hash_q_v = {}
  #   item_name_array = []
  #
  #
  #
  #   fixed_item_name_array = item_name_array.flatten.uniq
  #
  #   fixed_item_name_array.each do |item_name|
  #     outer_hash[item_name] = {:quantity => }
  # end
end
