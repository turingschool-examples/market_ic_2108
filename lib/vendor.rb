require './lib/item'

class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, number_to_stock)
    @inventory


  end


end
