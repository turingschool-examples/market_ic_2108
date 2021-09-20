require "rspec"
require "./lib/market"

describe Market do
  before(:each) do
  @market = Market.new("South Pearl Street Farmers Market")
  @vendor1 = Vendor.new("Rocky Mountain Fresh")
  @item1 = Item.new({name: 'Peach', price: "$0.75"})
  @item2 = Item.new({name: 'Tomato', price: "$0.50"})
  @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
  @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  @item5 = Item.new({name: 'Onion', price: '$0.25'})
  @vendor1.stock(@item1, 35)
  @vendor1.stock(@item2, 7)
  @vendor2 = Vendor.new("Ba-Nom-a-Nom")
  @vendor2.stock(@item4, 50)
  @vendor2.stock(@item3, 25)
  @vendor3 = Vendor.new("Palisade Peach Shack")
  @vendor3.stock(@item1, 65)
  @vendor3.stock(@item3, 10)
  end
  it 'exists' do
  expect(@market).to be_a(Market)
  end

  it 'attributes' do
    expect(@market.name).to eq("South Pearl Street Farmers Market")
    expect(@market.vendors).to eq([])
  end

  it "#add_vendor" do
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    expect(@market.vendors).to include(@vendor1, @vendor2, @vendor3)
  end

  it "#vendor_names" do
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    expect(@market.vendor_names).to include("Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack")
  end

  it "#vendors_that_sell" do
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    expect(@market.vendors_that_sell(@item1)).to include(@vendor1, @vendor3)
    expect(@market.vendors_that_sell(@item4)).to include(@vendor2)
  end

  it "#total_inventory" do
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    expected = {
              @item1 => {
                quantity: 100,
                vendors: [@vendor1, @vendor3]
              },
              @item2 => {
                quantity: 7,
                vendors: [@vendor1]
              },
              @item4 => {
                quantity: 50,
                vendors: [@vendor2]
              },
              @item3 => {
                quantity: 35,
                vendors: [@vendor2, @vendor3]
              }
              }
    expect(@market.total_inventory).to eq(expected)

  end

  it "#sorted_item_list" do
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

  expect(@market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
end

  xit '#date' do
    Date = double("date")

    allow(Date).to receive(:today).and_return(Time.new(2010))
  end
end
