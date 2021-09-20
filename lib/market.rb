require './lib/item'
require './lib/vendor'

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
    names = []
    @vendors.each do |name|
      names << @vendors[:name]
    end
    names
  end

end
