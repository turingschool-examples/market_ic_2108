require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Item do

  it 'exists' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor).to be_an_instance_of(Vendor)
  end

  it 'has attributes' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor.name).to eq("Rocky Mountain Fresh")
  end

  it 'has inventory default of zero' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end

  it 'has a stock default of 0' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    expect(vendor.check_stock(item1)).to eq(0)
  end

  it 'can stock an item' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    expect(vendor.stock(item1, 30)).to eq(30)
  end

  it 'can return an inventory hash' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    vendor.stock(item1, 30)

    expect(vendor.inventory).to eq({item1 => 30})
  end

  it 'can stock multiple items' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    vendor.stock(item1, 30)
    vendor.stock(item1, 25)

    expect(vendor.check_stock(item1)).to eq(55)

    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    vendor.stock(item2, 12)

    expect(vendor.check_stock(item2)).to eq(12)
  end

  it 'can return an inventory hash' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    item1 = Item.new({name: 'Peach', price: "$0.75"})
    vendor.stock(item1, 30)
    vendor.stock(item1, 25)

    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    vendor.stock(item2, 12)

    expect(vendor.inventory).to eq({item1 => 55, item2 => 12})
  end
  
end
