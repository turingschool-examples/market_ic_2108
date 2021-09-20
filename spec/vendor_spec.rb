require 'rspec'
require './lib/item'
require './lib/vendor'

describe Vendor do
  it 'exists' do

  vendor = Vendor.new("Rocky Mountain Fresh")
  expect(vendor).to be_a(Vendor)
  end

  it 'has a name' do

  vendor = Vendor.new("Rocky Mountain Fresh")
  expect(vendor.name).to eq("Rocky Mountain Fresh")
  end

  it 'has an empty inventory by default' do

  vendor = Vendor.new("Rocky Mountain Fresh")
  expect(vendor.inventory).to eq({})
  end

  it 'can can check the stock of an item' do

  vendor = Vendor.new("Rocky Mountain Fresh")
  item1 = Item.new({name: 'Peach', price: "$0.75"})
  vendor.check_stock(item1)

  expect(vendor.check_stock(item1)).to eq(0)
  end

  it 'can stock items' do

  vendor = Vendor.new("Rocky Mountain Fresh")
  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: '$0.50'})
  vendor.stock(item1, 30)
  vendor.stock(item1, 25)
  vendor.stock(item2, 12)

  expect(vendor.check_stock(item1)).to eq(55)
  expect(vendor.check_stock(item2)).to eq(12)
  end
end
