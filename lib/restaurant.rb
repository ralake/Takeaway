class Restaurant

  attr_reader :menues

  def initialize
    @menues = []
  end

  def add_menu(menu)
    menues << menu
  end

  def has_menu?
    !menues.empty?
  end

end