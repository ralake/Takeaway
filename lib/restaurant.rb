require_relative 'message'

class Restaurant

  include Message

  attr_reader :orders, :account

  def initialize
    @orders = []
    @account = 0
  end

  def receive_order(order, customer, amount)
    raise "You have sent insufficient payment. Please re-order" if amount < order.total_cost 
    customer.pay(amount)
    orders << order
    @account += amount
  end

  def process_order(customer, order)
    send_message(customer, order)
    orders.delete(order)
  end

end