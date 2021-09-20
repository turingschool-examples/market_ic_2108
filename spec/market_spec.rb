require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do

  it 'exists' do
    market = Market.new("South Pearl Street Farmers Market")
    expect(market).to be_an_instance_of(Market)
  end

  it 'has attributes' do
    market = Market.new("South Pearl Street Farmers Market")
    expect(market.name).to eq("South Pearl Street Farmers Market")
  end

  it 'can have vendors' do
    market = Market.new("South Pearl Street Farmers Market")
    expect(market.vendors).to eq([])
  end

  it 'can add vendors' do
    market = Market.new("South Pearl Street Farmers Market")

    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    vendor3 = Vendor.new("Palisade Peach Shack")

    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    expect(market.vendors).to eq([vendor1, vendor2, vendor3])
  end

  it 'can return vendor names' do
    market = Market.new("South Pearl Street Farmers Market")

    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    vendor3 = Vendor.new("Palisade Peach Shack")

    market.vendor_names(vendor1)
    market.vendor_names(vendor2)
    market.vendor_names(vendor3)

    expect(market.vendors).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end

  it 'can return vendors that sell an item' do
    market = Market.new("South Pearl Street Farmers Market")

    vendor1 = Vendor.new("Rocky Mountain Fresh")
    market.add_vendor(vendor1)

    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})

    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)

    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    market.add_vendor(vendor2)

    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    vendor2.stock(item3, 25)
    vendor2.stock(item4, 50)

    vendor3 = Vendor.new("Palisade Peach Shack")
    market.add_vendor(vendor3)

    vendor3.stock(item1, 65)

    expect(market.vendors_that_sell(item1)).to eq([vendor1, vendor3])
    expect(market.vendors_that_sell(item4)).to eq([vendor2])

  end

  xit 'can return potential revenue' do
    market = Market.new("South Pearl Street Farmers Market")

    vendor1 = Vendor.new("Rocky Mountain Fresh")
    market.add_vendor(vendor1)

    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})

    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)

    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    market.add_vendor(vendor2)

    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    vendor2.stock(item3, 25)
    vendor2.stock(item4, 50)

    vendor3 = Vendor.new("Palisade Peach Shack")
    market.add_vendor(vendor3)

    vendor3.stock(item1, 65)

    expect(vendor1.potential_revenue).to eq(29.75)
    expect(vendor2.potential_revenue).to eq(345)
    expect(vendor3.potential_revenue).to eq(48.75)

  end

end
