require 'rspec'
require './lib/item'
require './lib/vendor'

describe Vendor do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: '$0.75'})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @RMF = Vendor.new("Rocky Mountain Fresh")
  end

  it 'is an instance of a vendor' do
    expect(@RMF).to be_a(Vendor)
  end

  describe '#name' do
    it 'returns the name of the company' do
      expect(@RMF.name).to eq("Rocky Mountain Fresh")
    end
  end

  describe '#inventory' do
    it 'returns everything in inventory' do
      expect(@RMF.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'returns however many of a given item are in stock' do
      expect(@RMF.check_stock(@item1)).to eq(0)
    end
  end

  describe '#stock' do
    it 'adds the given item and quantities to the inventory' do
      @RMF.stock(@item1, 30)
      expect(@RMF.inventory).to eq({@item1: 30})
      @RMF.stock(@item2, 55)

      expect(@RMF.inventory).to eq({@item1: 30, @item2: 55})
      expect(@RMF.check_stock(@item1)).to eq(30)
    end
  end
end
