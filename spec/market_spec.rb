require './lib/item'
require './lib/vendor'
require './lib/market'

describe Market do
  before(:each) do
    @market =Market.new("South Pearl Street Farmers Market")
  end

  it 'exists' do
    expect(@market).to be_an_instance_of(Market)
  end

  it 'has a name and starts with no vendors' do
    expect(@market.name).to eq("South Pearl Street Farmers Market")
    expect(@market.vendors).to eq([])
  end
end
