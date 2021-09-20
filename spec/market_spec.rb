require 'rspec'
require './lib/vendor'
require './lib/item'
require './lib/market'

describe Market do
  it 'exists' do
    market = Market.new("South Pearl Street Farmers Market")
    expect(market).to be_an_instance_of(Market)
  end

  it 'attributes' do
    market = Market.new("South Pearl Street Farmers Market")
    expect(market.name).to eq("South Pearl Street Farmers Market")
    expect(market.vendors).to eq([])
  end

  it 'can add and track vendors' do

    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)

    vendor2 = Vendor.new("Ba-Nom-a-Nom")

    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)

    vendor3 = Vendor.new("Palisade Peach Shack")

    vendor3.stock(item1, 65)
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    expect(market.vendors).to eq [vendor1, vendor2, vendor3]
    expect(market.vendors_names).to eq  ["Rocky Mountain Fresh", "Ba-Nom-a-Nom",
       "Palisade Peach Shack"]
  end

  it 'can list vendors that sell an item' do

    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)

    vendor2 = Vendor.new("Ba-Nom-a-Nom")

    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)

    vendor3 = Vendor.new("Palisade Peach Shack")

    vendor3.stock(item1, 65)
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    expect(market.vendors_that_sell(item1)).to eq [vendor1, vendor3]
    expect(market.vendors_that_sell(item4)).to eq [vendor2]
  end

  xit 'can return a total inventory' do

    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)

    vendor2 = Vendor.new("Ba-Nom-a-Nom")

    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)

    vendor3 = Vendor.new("Palisade Peach Shack")

    vendor3.stock(item1, 65)
    vendor3.stock(item3, 10)
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    total_inventory = {
                      item1 => {quantity: 100,
                                 vendors: [vendor1, vendor3]},
                      item2 => {quantity: 7,
                                 vendors: [vendor1]},
                      item4 => {quantity: 50,
                                 vendors: [vendor2]},
                      item3 => {quantity: 35,
                                 vendors: [vendor2, vendor3]}
                               }

    expect(market.total_inventory).to eq total_inventory
  end

  xit 'returns a sorted_item_list' do
    expect(market.sorted_item_list).to eq (["Banana Nice Cream", "Peach",
       "Peach-Raspberry Nice Cream", "Tomato"])
  end

  xit 'overstocked_items' do
    ###
  end
end
