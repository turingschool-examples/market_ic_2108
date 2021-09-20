require 'rspec'
require './lib/item'

RSpec.describe Item do
  context 'Instantiation' do
    before :each do
      @item1 = Item.new({
        name:   'Peach',
        price:  "$0.75"
      })
    end

    it 'exists' do
      expect(@item1).to be_an Item
    end

    it 'has readable attributes' do
      expect(@item1.name).to eq 'Peach'
      expect(@item1.price).to eq 0.75
      expect(@item1.price).to be_a Float
    end
  end
end
