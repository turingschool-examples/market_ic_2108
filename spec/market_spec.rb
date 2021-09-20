require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe 'Item' do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
  end

  it "exist" do
    expect(@market).to be_a(Market)
  end

  it "has a name" do
    expect(@market.name).to eq("South Pearl Street Farmers Market")
  end

  it "can have vendors" do
    expect(@market.vendors).to eq([])
  end

  it "can add vendors" do
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)

    expect(@market.vendors).to eq([@vendor1, @vendor2])
  end

  it "can list vendor names" do
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)

    expect(@market.vendor_names).to eq([])
  end


end
