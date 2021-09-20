require 'rspec'
require './lib/item'

RSpec.describe Item do

  it 'exists' do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    expect(item1).to be_an_instance_of(Item)
  end

  it 'has attributs' do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    expect(item1.name).to eq('Peach')
    expect(item1.price).to eq("$0.75")

    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    expect(item2.name).to eq('Tomato')
    expect(item2.price).to eq("$0.50")
  end
end
