class Item
  attr_reader :name,
              :price

  def initialize(info)
    @name = info[:name]
    @price = info[:price].to_s.tr('$', ' ').to_f
  end
end
