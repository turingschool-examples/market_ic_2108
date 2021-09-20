require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  it 'exists' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor).to be_a(Vendor)
  end

  it 'has a name' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor.name).to eq("Rocky Mountain Fresh")
  end

  it 'does not have an inventory yet' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end

  xit 'can check stock' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor.check_stock).to eq(0)
  end
end
