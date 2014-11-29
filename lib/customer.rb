class Customer

  attr_reader :name, :account, :mobile_number

  def initialize(name, number)
    @name = name
    @mobile_number = number
    @account = 0
  end

  def add_dish(dish, order, quantity = 1)
    quantity.times { order.add_dish(dish) }
  end

  def remove_dish(dish, order, quantity = 1)
    quantity.times { order.remove_dish(dish) }
  end

  def pay(amount)
    @account -= amount
  end

  def add_to_account(amount)
    @account += amount
  end

end