require 'twilio-ruby'

module Message

  def send_message(customer, order)
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    @client.account.messages.create({
      from: ENV['TWILIO_NUMBER'],
      to:   customer.mobile_number,
      body: "Thanks for ordering!\nYou have ordered - \n\n#{order.details}\nOrder total - £#{order.total_cost}.\n\nYour food will be delivered before #{(Time.now + (60*60)).strftime("%H:%M")}."
    })
    "Message sent successfully"
  end

end

