require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  it 'exists' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    expect(vendor).to be_a(Vendor)
  end

  it 'has a name' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    expect(vendor.name).to eq("Rocky Mountain Fresh")
  end

  it 'starts with no inventory' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    expect(vendor.inventory).to eq({})
  end

  it 'starts with no stock' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    expect(vendor.check_stock(item1)).to eq(0)
  end

  it 'can add stock' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    expect(vendor.check_stock(item1)).to eq(0)

    vendor.stock(item1, 30)

    expect(vendor.check_stock(item1)).to eq(30)
  end

  it 'can check inventory' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    vendor.stock(item1, 30)

    results = {item1 => 30}
    expect(vendor.inventory).to eq(results)
  end

  it 'can stock multiple items and check inventory' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    vendor.stock(item1, 30)
    expect(vendor.check_stock(item1)).to eq(30)
    vendor.stock(item1, 25)
    expect(vendor.check_stock(item1)).to eq(55)
    vendor.stock(item2, 12)
    results = {item1 => 55, item2 => 12}
    expect(vendor.inventory).to eq(results)
  end
end
