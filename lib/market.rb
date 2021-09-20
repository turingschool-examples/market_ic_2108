
class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.check_stock(item) != nil && vendor.check_stock(item) > 0
    end
  end

  def total_inventory
    total_inventory = Hash.new
    @vendors.group_by |x| do 
  end
end
