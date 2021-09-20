class Vendor
  attr_reader :name,
              :inventory,
              :check_stock

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.empty? == true
      return 0
    else @inventory.find do |k,v|
      item == k
    end
      @inventory[k].values
    end
  end

  def stock(product, amount)
    @inventory.each do |item, quantity|
      if @inventory[item].nil?
        @inventory[product] = amount
      else @inventory[item] == product
        @inventory[product] += amount
      end
    end
    @inventory
  end
end
