require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'

describe Market do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: '$0.75'})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)
    @South_Pearl = Market.new("South Pearl Street Farmers Market")
  end

  it 'is an instance of Market' do
    expect(@South_Pearl).to be_a(Market)
  end

  describe '#name' do
    it 'returns the name of the market' do
      expect(@South_Pearl.name).to eq("South Pearl Street Farmers Market")
    end
  end

  describe '#vendors' do
    it 'returns all vendors in array form' do
      expect(@South_Pearl.vendors).to eq([])
    end
  end

  describe '#add_vendor' do
    it 'adds the given vendor to the market' do
      @South_Pearl.add_vendor(@vendor1)
      @South_Pearl.add_vendor(@vendor2)
      @South_Pearl.add_vendor(@vendor3)

      expect(@South_Pearl.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end
  end

  describe '#vendor_names' do
    it 'returns all names of vendors' do
      @South_Pearl.add_vendor(@vendor1)
      @South_Pearl.add_vendor(@vendor2)
      @South_Pearl.add_vendor(@vendor3)

      expect(@South_Pearl.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe '#vendors_that_sell' do
    it 'returns what vendors sell a given item' do
      @South_Pearl.add_vendor(@vendor1)
      @South_Pearl.add_vendor(@vendor2)
      @South_Pearl.add_vendor(@vendor3)

      expect(@South_Pearl.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@South_Pearl.vendors_that_sell(@item4)).to eq([@vendor2])
    end
  end
end
