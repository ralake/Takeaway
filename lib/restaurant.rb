require_relative 'message'

class Restaurant

  include Message

  attr_reader :menus, :orders, :account

  def initialize
    @menus = []
    @orders = []
    @account = 0
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

  def receive_order(order, amount)
    orders << order
    receive_payment(amount)
  end

  def receive_payment(amount)
    @account += amount
  end

  def process_order(order)
    send_message(order)
    orders.delete(order)
  end

  # private???

  def process_test_order(order)
    test_message(order)
    orders.delete(order)
  end

end