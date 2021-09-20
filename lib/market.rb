class Market < Vendor
  attr_reader :name,
              :vendors,
              :items
  def initialize(name)
    @name = name
    @vendors = []
    @items = []
  end

  def add_vendor(name)
    @vendors << name
  end

  def vendor_names
    vendors.push(@name)
  end

  def vendors_that_sell(item)
    @vendors.items.each do |item|
      @items << item
    end
  end
end
