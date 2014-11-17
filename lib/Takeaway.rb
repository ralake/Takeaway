require './dish'
require './order'
require './message'
require './restaurant'
require './menu'
require './customer'

rich = Customer.new("Rich")
puts rich.account
rich.add_to_account(20)
puts rich.account