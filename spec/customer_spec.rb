require './lib/customer'

describe Customer do

  let(:customer) { Customer.new("Rich") }

  it 'should have a name' do
    expect(customer.name).to eq("Rich")
  end

end