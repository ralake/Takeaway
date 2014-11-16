require_relative 'message'

class Restaurant

  include Message

  attr_reader :menus, :orders

  def initialize
    @menus = []
    @orders = []
  end

  def add_menu(menu)
    menus << menu
  end

  def remove_menu(menu)
    menus.delete(menu)
  end

  def has_menu?
    !menus.empty?
  end

  def receive_order(order)
    orders << order
  end

  def process_order(order)
    send_message(order)
    orders.delete(order)
  end

  def process_test_order(order)
    test_message(order)
    orders.delete(order)
  end

end