class Menu

  attr_reader :items

  def initialize
    @items = []
  end

  def add_dish(dish)
    items << dish
  end

  def remove_dish(dish)
    items.delete(dish)
  end

end