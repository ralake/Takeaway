class Order

  attr_reader :dishes, :order_lines

  def initialize
    @dishes = []
    @order_lines = String.new
  end

  def add_dish(dish)
    dishes << dish
  end

  def remove_dish(dish)
    dishes.delete(dish)
  end

  def details
    dishes.uniq.each { |dish| order_lines << "#{dishes.count(dish)} x #{dish.name} - £#{dish.price} each\n" }
    order_lines
  end

  def total_cost
    total = 0
    dishes.each { |item| total = item.price + total }
    total
  end

end