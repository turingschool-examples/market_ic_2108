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
end
