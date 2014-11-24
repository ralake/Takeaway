require './lib/restaurant'

describe Restaurant do

  let(:exotic_viscera)  { Restaurant.new }
  let(:leopard_tonsils) { double :dish }
  let(:first_order)     { double :order, dishes: [leopard_tonsils], total_cost: 9 }

  it 'can receive an order' do
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
    Restaurant.send(:public, *Restaurant.private_instance_methods)
    exotic_viscera.process_test_order(first_order)
    expect(exotic_viscera.orders).to eq([])
  end

end