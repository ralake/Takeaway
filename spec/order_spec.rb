require './lib/order'

describe Order do

  let(:order) { Order.new }
  let(:exotic_viscera) { double :Restaurant }
  let(:menu) { double :Menu }
  let(:goats_ears) { double :Dish, name: "goats ears", price: 12 }
  let(:bat_claws) { double :Dish, name: "bat claws", price: 10 }

  before do
    order.add_item(goats_ears)
    expect(order.items).to eq([goats_ears])
  end

  it 'can have an item added to it from the menu' do
    order.add_item(bat_claws)
    expect(order.items).to eq([goats_ears, bat_claws])
  end

  it 'can add differing quantites of the same dish' do
    order.add_item(bat_claws, 2)
    expect(order.items.count).to eq(3)
  end

  it 'can display information on its items, quantities and prices' do
    expect(order.details).to eq("1 x goats ears - £12 each\n")
  end

  it 'can have an item removed from it' do
    order.add_item(bat_claws)
    order.remove_item(goats_ears)
    expect(order.items).to eq([bat_claws])
  end

  it 'shows a total price for the order' do
    order.add_item(bat_claws)
    expect(order.total_cost).to eq(22)
  end

end