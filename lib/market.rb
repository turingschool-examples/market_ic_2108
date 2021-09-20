class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name     = name
    @vendors  = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    results = []
    @vendors.each do |vendor|
      vendor_names << vendor.name
    end
    results
  end

  def vendors_that_sell(item)
    results = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        # require "pry"; binding.pry
        if vendor.inventory.keys.include?(item)
          results << vendor
        end
      end
    end
    results
  end

  #   results = []
  #   @vendors.each do |vendor|
  #     if vendor.inventory.include?(item)
  #       results << vendor
  #       require "pry"; binding.pry
  #     end
  #   end
  #   results
  # end
end
