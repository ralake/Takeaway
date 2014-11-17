class Menu

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

end