class Item
  attr_reader :name,
              :price,
              :stock

  def initialize(info)
    @info = info
    @name = info[:name]
    @price = printed_price.to_f
    @stock = info[:stock] = 0
  end

  def printed_price
    @info[:price].slice!('$')
    @info[:price]
  end

  def change_stock(num)
    @stock += num
  end
end
