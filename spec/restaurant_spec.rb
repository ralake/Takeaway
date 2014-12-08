require './lib/restaurant'

describe Restaurant do

  let(:exotic_viscera)  { Restaurant.new }
  let(:rich)            { double :customer, mobile_number: ENV['MOB'] }
  let(:leopard_tonsils) { double :dish }
  let(:first_order)     { double :order, dishes: [leopard_tonsils], total_cost: 9 }

  it 'can receive an order' do
    allow(rich).to receive(:total_cost)
    allow(rich).to receive(:pay)
    exotic_viscera.receive_order(first_order, rich, 9)
    expect(exotic_viscera.orders).to eq([first_order])
  end

  it 'can process an order' do
    allow(exotic_viscera).to receive(:send_message)
    exotic_viscera.process_order(rich, first_order)
    expect(exotic_viscera.orders).to eq([])
  end

  it 'has an account set up to receive payment when initialized' do
    expect(exotic_viscera.account).to eq(0)
  end

  it 'receives an amount when an order is processed' do
    allow(rich).to receive(:total_cost)
    allow(rich).to receive(:pay)
    exotic_viscera.receive_order(first_order, rich, 9)
    expect(exotic_viscera.account).to eq(9)
  end

  it 'will not receive an order if the amount sent is less than the order total' do
    allow(rich).to receive(:total_cost)
    allow(rich).to receive(:pay)
    expect { exotic_viscera.receive_order(first_order, rich, 7)}.to raise_error("You have sent insufficient payment. Please re-order")
  end

end