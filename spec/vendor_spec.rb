require './lib/item'
require './lib/vendor'

RSpec.describe 'Vendor' do
  before(:each) do
    @item1 = Item.new({ name: 'Peach',
                        price: "$0.75"})
    @item2 = Item.new({ name: 'Tomato',
                        price: "$0.50"})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it "exists" do
    expect(@vendor).to be_a(Vendor)
  end

  it "has a name" do
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
  end

  it "has empty inventory by default" do
    expect(@vendor.inventory).to eq({})
  end

  it "can stock items" do
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 30)
    expect(@vendor.inventory).to eq({@item1 => 60})
  end

  xit "can check the stock of items" do
    expect(@vender.check_stock(@item1)).to eq(0)


  end
end
