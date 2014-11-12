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
    send_message(order)
    orders.delete(order)
  end

  def send_message(order)
    # Add code once figured out twilio
  end

end