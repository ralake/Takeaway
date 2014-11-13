class Order

  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(dish)
    items << dish
  end

  def remove_item(dish)
    items.delete(dish)
  end

  def send_order(restaurant)
    restaurant.receive_order(self)
    self.items.clear
  end

  def total_cost
    total = 0
    items.each { |item| total = item.price + total }
    total
  end

end