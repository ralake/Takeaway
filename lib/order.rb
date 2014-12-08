class Order

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    dishes << dish
  end

  def remove_dish(dish)
    dishes.delete(dish)
  end

  def details
    dishes.uniq.map { |dish| "#{dishes.count(dish)} x #{dish.name} - £#{dish.price} each\n" }.join(', ')
  end

  def total_cost
    dishes.map { |dish| dish.price }.reduce(&:+)
  end

end