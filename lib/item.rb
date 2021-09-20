class Item

  attr_reader :name, :price

  def initialize(data)
    @data = data
    @name = data[:name]
  end

  def price
    @data[:price].delete_prefix("$").to_f.round(1)
  end
end
