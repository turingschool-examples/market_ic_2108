require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'

describe Market do
  it 'exists' do
    market = Market.new("South Pearl Street Farmers Market")

    expect(market.name).to eq("South Pearl Street Farmers Market")
    expect(market.vendors).to eqq([])
  end
end
