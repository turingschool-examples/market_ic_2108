require 'rspec'
require './lib/item'

describe Item do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: '$0.75'})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  it 'is an Item' do
    expect(@item1).to be_a(Item)
  end

  describe '#name' do
    it 'returns the name of the item' do
      expect(@item2.name).to eq('Tomato')
    end
  end

  describe '#price' do
    it 'returns the price of the item' do
      expect(@item2.price).to eq(0.5)
    end
  end
end
