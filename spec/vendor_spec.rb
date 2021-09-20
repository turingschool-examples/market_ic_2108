require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before :each do
    @vendor = Vendor.new("Rocky Mountain Fresh")

    #@item1 = Item.new({name: 'Peach', price: "$0.75"})
    #@item2 = Item.new({name: 'Tomato', price: '$0.50'})
    
  end

  it "is an instance of Vendor" do
    expect(@vendor).to be_an_instance_of(Vendor)
  end
end
