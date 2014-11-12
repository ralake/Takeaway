# require './lib/line_item'

# describe LineItem do

#   let(:line_item) { LineItem.new }
#   let(:menu) { double :Menu, :bat_claws => 12 }
#   let(:bat_claws) { double :Dish }

#   it 'initializes as empty' do
#     expect(line_item.line).to eq([])
#   end

#   it 'can add a dish from the menu' do
#     allow(menu).to receive(:find).and_return[bat_claws]
#     line_item.add_dish(menu, bat_claws)
#     expect(line_item.line).to eq([bat_claws])
#   end

# end