class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name    = name
    @vendors = []
  end

  def add_vendor(vendor_names)
    @vendors << vendor_names
  end
end


# The Market will need to keep track of its
#  Vendors and their Items. Each Vendor will be
#  able to report its total inventory, stock i
#  tems, and return the quantity of items. Any
#  item not in stock should return `0` by default.
