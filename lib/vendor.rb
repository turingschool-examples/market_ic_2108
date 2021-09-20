class Vendor
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory.include?(item)
      @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    potential = []
    @inventory.each do |item, quantity|
      potential << (item.price * quantity)
    end
    potential.sum
  end
end
