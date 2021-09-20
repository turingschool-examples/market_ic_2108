require './lib/item'
require './lib/vendor'

RSpec.describe Item do
  before :each do
    @vendor = Vendor.new("Rocky Mountain Fresh")

    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})

  end

  it 'is an instance of Item' do
    expect(@item1).to be_an_instance_of(Item)
    expect(@item2).to be_an_instance_of(Item)
  end

  it 'has a name and price attributes' do
    expect(@item2.name).to eq("Tomato")
    expect(@item2.price).to eq(0.5)
  end

  # it "#check_stock is 0 by default" do
  #   expect(@vendor.check_stock(@item1)).to eq(0)
  # end

  it "#stock" do

    @vendor.stock(@item1, 30)

    expect(@vendor.inventory.to eq({@item1 => 30}))
  end
end
