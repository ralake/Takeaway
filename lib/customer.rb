class Customer

  attr_reader :name, :account

  def initialize(name)
    @name = name
    @account = 0
  end

  def add_dish(dish, order, quantity = 1)
    quantity.times { order.add_dish(dish) }
  end

  def remove_dish(dish, order, quantity = 1)
    quantity.times { order.remove_dish(dish) }
  end

  def place_order(order, restaurant, amount)
    if amount < order.total_cost then raise "You have sent insufficient payment. Please re-order"
    else
      restaurant.receive_order(order, amount)
      @account -= amount
    end
  end

  def add_to_account(amount)
    @account += amount
  end

end