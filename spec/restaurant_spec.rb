require './lib/restaurant'

describe Restaurant do

  let(:the_exotic_viscera_emporium) { Restaurant.new }
  let(:menu) { double :Menu }

  it 'can hold menues' do
    expect(the_exotic_viscera_emporium.menues).to be_an_instance_of(Array)
  end

  it 'knows if it has a menu' do
    the_exotic_viscera_emporium.add_menu(menu)
    expect(the_exotic_viscera_emporium.has_menu?).to be true
  end

  it 'knows if it does not have a menu' do
    expect(the_exotic_viscera_emporium).not_to have_menu
  end

end