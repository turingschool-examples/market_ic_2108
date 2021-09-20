# Market holds an array of vendors that contain items

class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors.push(vendor)
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name }
  end

  def total_inventory
    return_hash = {}
    vendors.each do |vendor|
      vendor.inventory.each do |item|
        if return_hash[item[0]].nil?
          return_hash[item[0]] = {quantity: item[1], vendors: [vendor] }
        else
          return_hash[item[0]][:quantity] += item[1]
          return_hash[item[0]][:vendors] += [vendor]
        end
      end
    end
    return_hash
  end
end
