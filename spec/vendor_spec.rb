require 'rspec'
require './lib/item'
require './lib/vendor'

describe Vendor do

  it 'exists' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    expect(vendor).to be_a(Vendor)
    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end

  it 'checks stock' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({
                  :name => "Peach",
                  :price => "0.75"
    })
    item2 = Item.new({
                  :name => "Tomato",
                  :price => "0.50"
    })

    expect(vendor.check_stock(item1)).to eq(0)
    expect(vendor.check_stock(item2)).to eq(0)
  end

  it 'adds items' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({
                  :name => "Peach",
                  :price => "0.75"
    })

    vendor.add_item(item1)
    expect(vendor.inventory).to eq(item1 => 0)
  end

  it 'stocks items' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({
                  :name => "Peach",
                  :price => "0.75"
    })
    item2 = Item.new({
                  :name => "Tomato",
                  :price => "0.50"
    })
      vendor.add_item(item1)

    expect(vendor.check_stock(item1)).to eq(0)
    vendor.stock(item1, 30)
    expect(vendor.inventory).to eq({item1 => 30})
    expect(vendor.check_stock(item1)).to eq(30)

    vendor.stock(item1, 25)
    expect(vendor.check_stock(item1)).to eq(55)

    vendor.add_item(item2)
    vendor.stock(item2, 12)

    expect(vendor.inventory).to eq({item1 => 55, item2 => 12})
  end


end
