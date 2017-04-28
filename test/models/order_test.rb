require "test_helper"

describe Order do
  let(:order) { Order.new }

  it "A new order is created when session starts" do

  end

  it "can add a product" do
    orders(:one).add_product(products(:apple), 3)
    orders
  end

  it "has an order status" do

  end

  it "can have one orderitem" do

  end

  it "can have multiple order items" do

  end

  it "can get the subtotal of the orderitems in the order" do

  end

end
