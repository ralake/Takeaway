class Order

  attr_reader :items, :quantity

  def initialize
    @items = []
  end

  def add_item(dish, quantity = 1)
    quantity.times { items << dish }
  end

  def remove_item(dish)
    items.delete(dish)
  end

  def send_order(restaurant)
    restaurant.receive_order(self)
  end

  def details
    details = String.new
    items.uniq.each do |dish|
      details << "#{items.count(dish)} x #{dish.name} - £#{dish.price} each\n"
    end
    details
  end

  def total_cost
    total = 0
    items.each { |item| total = item.price + total }
    total
  end

end