class Customer

  attr_reader :name, :account

  def initialize(name)
    @name = name
    @account = 0
  end

  def submit_order(order, restaurant)
    restaurant.receive_order(order)
  end

  def add_to_account(amount)
    @account += amount
  end

end