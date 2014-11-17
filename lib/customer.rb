class Customer

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def submit_order(order, restaurant)
    restaurant.receive_order(order)
  end

end