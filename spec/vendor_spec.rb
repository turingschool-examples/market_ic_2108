require './lib/vendor'
require './lib/item'
require 'rspec'

describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({
      name: 'Peach',
      price: "$0.75"})
    @item2 = Item.new({
      name: 'Tomato',
      price: '$0.50'})
  end

  it 'exists' do
    expect(@vendor).to be_a Vendor
  end

  it 'has readable attributes' do
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
    expect(@vendor.inventory).to eq({})
  end

  describe '#check_stock' do
    it 'can check stock of an item' do
      expect(@vendor.check_stock(@item1)).to eq(0)
    end
  end

  describe '#stock' do
    it 'can stock an item in inventory' do
      @vendor.stock(@item1, 30)

      expect(@vendor.inventory).to eq({@item1 => 30})
    end
  end
end
