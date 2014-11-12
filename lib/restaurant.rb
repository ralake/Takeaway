class Restaurant

  attr_reader :menues, :orders

  def initialize
    @menues = []
    @orders = []
  end

  def add_menu(menu)
    menues << menu
  end

  def remove_menu(menu)
    menues.delete(menu)
  end

  def has_menu?
    !menues.empty?
  end

  def receive_order(order)
    orders << order
  end

  def process_order(order)
    order.send_confirmation
    orders.delete(order)
  end

end