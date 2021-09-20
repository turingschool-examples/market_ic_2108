require './lib/vendor'
require './lib/item'
require './lib/market'
require 'rspec'

describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @item2 = Item.new({
      name: 'Tomato',
      price: "$0.50"})
    @item3 = Item.new({
      name: "Peach-Raspberry Nice Cream",
      price: "$5.30"})
    @item4 = Item.new({
      name: "Banana Nice Cream",
      price: "$4.25"})
  end

  it 'exists' do
    expect(@market).to be_a Market
  end

  it 'has readable attributes' do
    expect(@market.name).to eq("South Pearl Street Farmers Market")
    expect(@market.vendors).to eq([])
  end 
end
