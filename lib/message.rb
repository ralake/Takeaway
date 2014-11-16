require 'twilio-ruby'

class Message

  def send
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    @client.account.messages.create(
            :from => ENV['TWILIO_NUMBER'],
            :to => ENV['MY_NUMBER'],
            :body => "Thankyou for ordering! Your order will arrive before #{(Time.now + (60*60)).strftime("%H:%M")}."
    )
    "Message sent to customer"
  end

end
