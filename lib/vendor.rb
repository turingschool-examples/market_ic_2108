class Vendor
  attr_reader :name,
              :inventory,
              :quant

  def initialize(name)
    @name = name
    @inventory = {}
  end


  def check_stock(item, quant = 0)
    stocked = []
    if inventory.empty? == false
      @inventory.each do |stock|
        stocked << quant
        stocked.sum
      end
      stock
    else
      return 0
    end
  end

  def stock(item, quant)
    @inventory[item] = quant
  end




end
