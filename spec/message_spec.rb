require './lib/message'

describe Message do

  let(:message) { double :Message }
  let(:first_order) { double :Order }

  
  it 'can compose a confirmation message' do
    expect(message).to receive(:send).and_return("Message sent to customer")
    message.send
  end
  
end