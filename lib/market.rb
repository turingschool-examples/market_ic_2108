class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(name)
    @vendors.push(name)
  end

  def vendor_names
    names_array = []
    @vendors.each do |vendor|
      names_array << vendor.name
    end
    names_array
  end

  def vendors_that_sell(item)
    vendors_array = []
    @vendors.each do |vendor|
      vendors_array << vendor if vendor.inventory.keys[0].name == item.name
    end
    vendors_array
  end

  def potential_revenue

  end
end
