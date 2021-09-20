require './lib/vendor'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it "exists" do
    expect(@vendor).to be_an_instance_of(Vendor)
  end

  it 'has attributes' do
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
  end

  it 'has empty inventory by default' do
    expect(@vendor.inventory).to eq({})
  end

  it 'returns zero stock by default' do
    expect(@vendor.check_stock).to eq(0)
  end
end
