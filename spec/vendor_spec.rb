require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before :each do
    @item1 = Item.new({
      name: 'Peach',
      price: '$0.75'
      })
    @item2 = Item.new({
      name: 'Tomato',
      price: '$0.50'
      })
    @vendor = Vendor.new('Rocky Mountain Fresh')
  end

  context 'Instantiation' do
    it 'exists' do
      expect(@vendor).to be_a Vendor
    end

    it 'has a name and an inventory' do
      expect(@vendor.name).to eq 'Rocky Mountain Fresh'
      expect(@vendor.inventory).to eq({})
      expect(@vendor.inventory).to be_a Hash
    end
  end

  context 'Methods' do
    it '#check_stock starts at 0' do
      expect(@vendor.check_stock(@item1)).to eq 0
    end

    it '#stock adds to the inventory' do
      @vendor.stock(@item1, 30)

      expect(@vendor.inventory).to include(@item1 => 30)
      expect(@vendor.check_stock(@item1)).to eq 30

      @vendor.stock(@item1, 25)

      expect(@vendor.check_stock(@item1)).to eq 55

      @vendor.stock(@item2, 12)

      expect(@vendor.inventory).to include(@item1 => 55)
      expect(@vendor.inventory).to include(@item2 => 12)
    end
  end
end
