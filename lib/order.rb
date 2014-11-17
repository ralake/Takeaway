class Order

  attr_reader :items, :order_lines

  def initialize
    @items = []
    @order_lines = String.new
  end

  def add_item(dish, quantity = 1)
    quantity.times { items << dish }
  end

  def remove_item(dish)
    items.delete(dish)
  end

  def details
    items.uniq.each { |dish| order_lines << "#{items.count(dish)} x #{dish.name} - £#{dish.price} each\n" }
    order_lines
  end

  def total_cost
    total = 0
    items.each { |item| total = item.price + total }
    total
  end

end