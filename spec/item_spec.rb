require './lib/item'


describe Item do
  it 'exists' do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    expect(item1).to be_an_instance_of(Item)
  end

  it 'has a name' do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    expect(item1.name).to eq('Peach')
  end

  it 'has a price' do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    expect(item1.price).to eq("$0.75")
  end
end
