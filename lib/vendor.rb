class Vendor
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
   @inventory.values.any? do |item|
     item.empty?
   end
  end

  def stock(item_number, item_quantity)

    @inventory << item_quantity
  end
end
