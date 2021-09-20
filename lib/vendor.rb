class Vendor

  attr_reader :name, :inventory

  def initialize(name)
    @name       = name
    @inventory  = {}
  end

  def check_stock(item)
    if @inventory[item] == nil
      return 0
    else
      @inventory[item]
    end
  end

  def stock(item, amount)
    if @inventory[item] == nil
      @inventory[item] = amount
    else
      @inventory[item] = @inventory[item] + amount
    end
  end

  def potential_revenue
      price = 0.0
      pr = 0.0
      y = @inventory.each do |item, value|
        price = ((item.price[-4..-1].to_f))
        pr += price * value
      end
      pr
  end
end
