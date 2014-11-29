Takeaway
========
Makers Academy Week 2 Challenge

Brief
-----
Write a Takeaway app.

Implement the following functionality:
list of dishes with prices
placing the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
The text sending functionality should be implemented using Twilio API.
Use twilio-ruby gem to access the API
Use a Gemfile to manage your gems
Make sure that your Takeaway class is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
However, if your Takeaway class is loaded into IRB and the order is placed, the text should actually be sent.

Domain Model
------------

A takeaway restaurant will have a menu containing a list of dishes, each with specific prices. A customer can select dishes and place an order with the restaurant, sending an amount along with the order. Once the restaurant has received and processed the order, they will send a message to the customer detailing their order, the total cost and a delivery time-frame.

Classes - customer, dish, menu, restaurant, order.

Customer
--------
Responsibilities  | Collaborators
------------- | -------------
add dishes to order | dish
pay for order | order

Dish
----
Responsibilities  | Collaborators
------------- | -------------
have price | order
have name | customer
 | menu

Menu
----
Responsibilities  | Collaborators
------------- | -------------
holds dishes | dish
 | customer

Restaurant
----------
Responsibilities  | Collaborators
------------- | -------------
receive order  | customer
send message  | order
 | message

Order
-----
Responsibilities  | Collaborators
------------- | -------------
holds dishes | restaurant
has total cost | customer
 | dish
