require './lib/restaurant'
require './lib/message'

describe Restaurant do

  let(:exotic_viscera) { Restaurant.new }
  let(:leopard_tonsils) { double :dish }
  let(:seagull_cheeks) { double :dish }
  let(:first_menu) { double :Menu, items: [leopard_tonsils] }
  let(:first_order) { double :order, items: [leopard_tonsils], total_cost: 9 }
  let(:second_order) { double :order, items: [seagull_cheeks]}

  it 'can hold menues' do
    expect(exotic_viscera.menus).to be_an_instance_of(Array)
  end

  it 'knows if it has a menu' do
    exotic_viscera.add_menu(first_menu)
    expect(exotic_viscera.has_menu?).to be true
  end

  it 'can remove a menu' do
    exotic_viscera.add_menu(first_menu)
    exotic_viscera.remove_menu(first_menu)
    expect(exotic_viscera.has_menu?).to be false
  end

  it 'knows if it does not have a menu' do
    expect(exotic_viscera).not_to have_menu
  end

  it 'can receive an order' do
    exotic_viscera.add_menu(first_menu)
    allow(first_menu).to receive(:items)
    exotic_viscera.receive_order(first_order, 9)
    expect(exotic_viscera.orders).to eq([first_order])
  end

  it 'has an account set up to receive payment when initialized' do
    expect(exotic_viscera.account).to eq(0)
  end

  it 'can receive payment for an order' do
    exotic_viscera.receive_payment(8)
    expect(exotic_viscera.account).to eq(8)
  end

  it 'can process an order' do
    allow(first_order).to receive(:details)
    allow(first_order).to receive(:total_cost)
    exotic_viscera.process_test_order(first_order)
    expect(exotic_viscera.orders).to eq([])
  end

end