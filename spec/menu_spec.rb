require './lib/menu'

describe Menu do

  let(:menu)              { Menu.new }
  let(:parrot_brains)     { double :Dish }
  let(:capybara_eyeballs) { double :Dish, price: 12 }

  it 'should have a list of its dishes' do
    expect(menu.dishes).to eq([])
  end

  it 'should be able to add a dish' do
    menu.add_dish(parrot_brains)
    expect(menu.dishes).to eq([parrot_brains])
  end

  it 'should be able to remove a dish' do
    menu.add_dish(parrot_brains)
    menu.add_dish(capybara_eyeballs)
    menu.remove_dish(parrot_brains)
    expect(menu.dishes).to eq([capybara_eyeballs])
  end

end