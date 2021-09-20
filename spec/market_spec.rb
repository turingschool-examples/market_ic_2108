require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  context 'Instantiation' do
    before :each do
      @market = Market.new('South Pearl Street Farmers Market')
    end

    it 'exists' do
      expect(@market).to be_a Market
    end

    it 'has a name and starts with 0 vendors' do
      expect(@market.name).to eq 'South Pearl Street Farmers Market'
      expect(@market.vendors).to eq []
    end
  end

  context 'Methods' do
    before :each do
      # I am starting to learn about let (instead of before)
      # and might prefer to use let blocks here instead.
      # For the sake of time, however, I'm going with before!
      @market = Market.new('South Pearl Street Farmers Market')
      @vendor1 = Vendor.new('Rocky Mountain Fresh')
      @item1 = Item.new({name: 'Peach', price: "$0.75"})
      @item2 = Item.new({name: 'Tomato', price: "$0.50"})
      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2 = Vendor.new("Ba-Nom-a-Nom")
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3 = Vendor.new("Palisade Peach Shack")
      @vendor3.stock(@item1, 65)
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
    end

    it '#add_vendor' do
      expect(@market.vendors).to eq [@vendor1, @vendor2, @vendor3]
    end

    it '#vendor_names' do
      expected = [
        "Rocky Mountain Fresh",
        "Ba-Nom-a-Nom",
        "Palisade Peach Shack"
      ]
      expect(@market.vendor_names).to eq expected
    end

    it '#vendors_that_sell returns vendors that sell a specific item' do
      expect(@market.vendors_that_sell(@item1)).to eq [@vendor1, @vendor3]
      expect(@market.vendors_that_sell(@item4)).to eq [@vendor2]
    end

    it '#potential_revenue' do
      expect(@vendor1.potential_revenue).to be_a Float
      expect(@vendor1.potential_revenue).to eq 29.75
      expect(@vendor2.potential_revenue).to eq 345.00
      expect(@vendor3.potential_revenue).to eq 48.75
    end
  end
end
