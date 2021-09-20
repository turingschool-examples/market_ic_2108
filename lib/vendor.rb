class Vendor
  attr_reader :name, :inventory, :stock

  def initialize(name)
    @name = name
    @stock = 0
    @inventory = {}
  end

  def check_stock(item)
    @stock
  end

  def add_item(item)
    @inventory[item] = @stock
  end

  def stock(item, quantity)

    @inventory.merge(@inventory) do |k, v|
      @stock += quantity
    end
  end
end
