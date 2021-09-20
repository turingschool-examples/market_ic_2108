require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do

  context 'Iteration 1' do

    before (:each) do
      @item1 = Item.new({name: 'Peach', price: "$0.75"})
      @item2 = Item.new({name: 'Tomato', price: '$0.50'})
      @vendor = Vendor.new("Rocky Mountain Fresh")
    end

    it 'can retrieve attributes from items' do
      expect(@item2.name).to eq('Tomato')
      expect(@item2.price).to eq(0.5)
    end

    it 'has a name and inventory' do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
      expect(@vendor.inventory).to eq({})
    end

    it '#check_stock' do
      expect(@vendor.check_stock(@item1)).to eq(0)
    end

    it '#stock' do
      @vendor.stock(@item1, 30)
      expect(@vendor.inventory).to eq({@item1 => 30})
      expect(@vendor.check_stock(@item1)).to eq(30)

      @vendor.stock(@item1, 25)
      expect(@vendor.check_stock(@item1)).to eq(55)

      @vendor.stock(@item2, 12)
      expect(@vendor.inventory).to eq({@item1 => 55, @item2 => 12})
    end
  end


end
