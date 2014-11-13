require './lib/restaurant'

describe Restaurant do

  let(:the_exotic_viscera_emporium) { Restaurant.new }
  let(:menu) { double :Menu }
  let(:first_order) { double :Order}

  it 'can hold menues' do
    expect(the_exotic_viscera_emporium.menues).to be_an_instance_of(Array)
  end

  it 'knows if it has a menu' do
    the_exotic_viscera_emporium.add_menu(menu)
    expect(the_exotic_viscera_emporium.has_menu?).to be true
  end

  it 'can remove a menu' do
    the_exotic_viscera_emporium.add_menu(menu)
    the_exotic_viscera_emporium.remove_menu(menu)
    expect(the_exotic_viscera_emporium.has_menu?).to be false
  end

  it 'knows if it does not have a menu' do
    expect(the_exotic_viscera_emporium).not_to have_menu
  end

  it 'can receive and order' do
    the_exotic_viscera_emporium.receive_order(first_order)
    expect(the_exotic_viscera_emporium.orders).to eq([first_order])
  end

  it 'can process an order' do
    the_exotic_viscera_emporium.receive_order(first_order)
    the_exotic_viscera_emporium.process_order(first_order)
    expect(the_exotic_viscera_emporium.orders).to eq([])
  end

  # As customer will order by adding dishes to order rather than accessing them from the menu
  # create a test and method that checks that the order placed contains items that are in the menu

end