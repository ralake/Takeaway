require './lib/order'

describe Order do

  let(:order)          { Order.new }
  let(:exotic_viscera) { double :Restaurant }
  let(:menu)           { double :Menu, dishes: [goats_ears] }
  let(:goats_ears)     { double :Dish, name: "goats ears", price: 12 }
  let(:bat_claws)      { double :Dish, name: "bat claws", price: 10 }

  before do
    order.add_dish(goats_ears)
    expect(order.dishes).to eq([goats_ears])
  end

  it 'can have dishes added by the customer' do
    order.add_dish(bat_claws)
    expect(order.dishes).to eq([goats_ears, bat_claws])
  end

  it 'can have an item removed from it by the customer' do
    order.remove_dish(goats_ears)
    expect(order.dishes).to eq([])
  end

  it 'can display information on its items, quantities and prices' do
    expect(order.details).to eq("1 x goats ears - £12 each\n")
  end

  it 'shows a total price for the order' do
    order.add_dish(bat_claws)
    expect(order.total_cost).to eq(22)
  end
  
end