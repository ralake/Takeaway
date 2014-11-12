require './lib/dish'

describe Dish do

  dish = Dish.new("Parrot Brains", 25)

  it 'has a name' do
    expect(dish.name).to eq("Parrot Brains")
  end

  it 'has a price' do
    expect(dish.price).to eq(25)
  end

end