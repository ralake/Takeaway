require './lib/customer'

describe Customer do

  let(:rich) { Customer.new("Rich") }
  let(:richs_order) { double :order , items: [crispy_eyelids] }
  let(:crispy_eyelids) { double :dish }
  let(:exotic_viscera) { double :restaurant }

  it 'should have a name' do
    expect(rich.name).to eq("Rich")
  end

  it 'should be able to send an order to a restaurant' do
    expect(exotic_viscera).to receive(:receive_order)
    rich.submit_order(richs_order, exotic_viscera)
  end

end