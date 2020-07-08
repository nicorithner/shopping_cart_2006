require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'
require "pry"

class ShoppingCartTest < Minitest::Test
  #Iteration1
  def test_it_exists
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_instance_of ShoppingCart, cart
  end

  def test_it_has_attributes
    cart = ShoppingCart.new("King Soopers", "30items")
    
    assert_equal "King Soopers", cart.name
    assert_equal 30, cart.capacity
    assert_equal [], cart.products
  end

  def test_it_can_add_products
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(product1)
    cart.add_product(product2)
# binding.pry
    assert_equal [product1, product2], cart.products
    assert_equal cart_details = {name: "King Soopers", capacity: 30}, cart.details
  end

  def test_total_number_of_products
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart.add_product(product1)

    cart.add_product(product2)

    cart.add_product(product3)

    assert_equal 13, cart.total_number_of_products
  end



end
