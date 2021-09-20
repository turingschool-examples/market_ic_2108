class Market

  attr_reader   :name,
                :vendors

  def initialize(name)
    @name       = name
    @vendors    = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names(vendor)
    @vendors << vendor.name
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.check_stock(item) > 0
    end
  end

  def potential_revenue
    total = 0
    @vendors.map do |vendor|
      vendor.inventory.map do |item, amount|
        total += item * amount
      end
    end
    total
  end

end
