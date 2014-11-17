require 'twilio-ruby'

module Message

  def send_message(order)
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    @client.account.messages.create({
      :from => ENV['TWILIO_NUMBER'],
      :to => ENV['MY_NUMBER'],
      :body => "Thanks for ordering!\nYou have ordered - \n\n#{order.details}\nOrder total - £#{order.total_cost}.\n\nYour food will be delivered before #{(Time.now + (60*60)).strftime("%H:%M")}."
    })
    "Message sent successfully"
  end

  private

  def test_message(order)
    test_account_sid = 'ACa0c99adedad71c267f0194d78cf73191'
    test_auth_token = '0edcbc52cd59841fd0d078440024838d'
    @client = Twilio::REST::Client.new(test_account_sid, test_auth_token)
    @client.account.messages.create({
      :from => +15005550006,
      :to => ENV['MY_NUMBER'],
      :body => "Thanks for ordering!\nYou have ordered...\n\n#{order.details}.\nOrder total - £#{order.total_cost}.\n\nYour food will be delivered before #{(Time.now + (60*60)).strftime("%H:%M")}."
    })
    "Message sent successfully"
  end

end

