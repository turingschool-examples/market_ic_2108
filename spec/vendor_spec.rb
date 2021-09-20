require './lib/item'
require './lib/vendor'

describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end
  it 'exists' do
    expect(@vendor).to be_an_instance_of(Vendor)
  end

  it 'has a name' do
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
  end

  it 'starts with an empty inventory' do
    expect(@vendor.inventory).to eq({})
  end

  it 'can check inventory for item stock' do
    results = @vendor.check_stock(@item1)
    expect(results).to eq(0)
  end

  it 'can stock items' do
    @vendor.stock(@item1, 30)

    expect(@vendor.inventory).to eq({@item1 => 30})

    results = @vendor.check_stock(@item1)
    expect(results).to eq(30)

    @vendor.stock(@item2, 12)
    expect(@vendor.inventory).to eq({@item1 => 30, @item2 => 12})
  end

  it 'can add stock to existing values' do
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)
    results = @vendor.check_stock(@item1)

    expect(results).to eq(55)
  end
end
