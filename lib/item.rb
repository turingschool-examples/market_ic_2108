class Item
  attr_reader :name

  def initialize(item)
    @name = item[:name]
    @price = item[:price]
  end

  def price
    @price.delete("$").to_f
  end
end
