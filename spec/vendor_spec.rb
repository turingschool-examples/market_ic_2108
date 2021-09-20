require './lib/item'
require './lib/vendor'

RSpec.describe 'Vendor' do
  it 'exists' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    expect(vendor).to be_an_instance_of(Vendor)
  end

  it 'had inventory' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    expect(vendor.inventory).to eq({})
  end
end
