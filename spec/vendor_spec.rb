require './lib/item'
require './lib/vendor'

RSpec.describe 'Vendor' do
  it 'exists' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    expect(vendor).to be_an_instance_of(Vendor)
  end
end
