class Item
  attr_reader :name,
              :price,
              :stock


  def initialize(info)
    @name = info[:name]
    @price = info[:price].gsub(/[$]/, '').to_f.round(2)
    @stock = 0

  end

  def check_stock(item)
    item.stock
  end

  def stock(item, quantity)
    item.stock += quantity
  end


end
