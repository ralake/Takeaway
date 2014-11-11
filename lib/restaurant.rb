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
    orders.delete(order)
    order.send_confirmation
  end

end