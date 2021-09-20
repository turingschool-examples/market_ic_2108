class Vendor
  attr_reader :name,
              :inventory,
              :check_stock
  def initialize(name)
    @name = name
    @inventory = {}
    # @check_stock = check_stock
  end

  def check_stock(items_stocked)
    check_stock = 0
  end

  def inventory_items
    items = @inventory.items
    check_stock = 0
    items.each do |item_name|
      @inventory[item_name]
      check_stock = (check_stock + @inventory[item_name])
    end
    check_stock
  end

  def stock(item_name, amount)
    @inventory[item_name] = amount
    @inventory << inventory_items
  end
end
