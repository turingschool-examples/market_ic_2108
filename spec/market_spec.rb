require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'

describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

  end
  describe '#initialize' do
    it 'exists' do
      expect(@market).to be_an_instance_of Market
    end
  end

  describe '#add_vendor' do
    it 'adds a vendor to vendors' do
      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end
  end

  describe '#vendor_names' do
    it 'returns an array of vendor names' do
      expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]

      expect(@market.vendor_names).to eq(expected)
    end
  end

  describe '#vendors_that_sell' do
    it 'returns an array of vendors that have an item in stock' do
      # require 'pry'; binding.pry
      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
    end
  end

  describe '#potential_revenue' do
    it 'returns the price * stock' do
      expect(@vendor1.potential_revenue).to eq(29.75)
      expect(@vendor2.potential_revenue).to eq(345.00)
      expect(@vendor3.potential_revenue).to eq(48.75)
    end
  end
end
