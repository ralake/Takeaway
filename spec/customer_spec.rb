require './lib/customer'

describe Customer do

  let(:rich)           { Customer.new("Rich") }
  let(:first_order)    { double :order , dishes: [crispy_eyelids], total_cost: 12 }
  let(:crispy_eyelids) { double :dish, price: 12 }
  let(:neck_skin)      { double :dish }
  let(:exotic_viscera) { double :restaurant }

  before(:each) do
    allow(exotic_viscera).to receive(:receive_payment)
    allow(exotic_viscera).to receive(:receive_order)
  end

  it 'should have a name' do
    expect(rich.name).to eq("Rich")
  end

  it 'should have a payment account set at 0 when initialized' do
    expect(rich.account).to eq(0)
  end

  it 'should be able to add to its account' do
    rich.add_to_account(20)
    expect(rich.account).to eq(20)
  end

  it 'should be able to add dished to an order' do
    expect(first_order).to receive(:add_dish)
    rich.add_dish(neck_skin, first_order)
  end

  it 'should be able to remove dishes from an order' do
    expect(first_order).to receive(:remove_dish)
    rich.remove_dish(crispy_eyelids, first_order)
  end

  it 'should be able to place an order' do
    rich.add_to_account(20)
    allow(first_order).to receive(:total_cost).and_return(12)
    rich.place_order(first_order, exotic_viscera, 12)
    expect(rich.account).to eq(8)
  end

  it 'should not be allowed to place an order if the amount sent does not equal the order total' do
    expect { rich.place_order(first_order, exotic_viscera, 10) }.to raise_error("You have sent insufficient payment. Please re-order")
  end

end