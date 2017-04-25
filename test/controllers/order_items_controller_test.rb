require "test_helper"

describe OrderItemsController do

it "should create an order item product" do
  proc   {
    post order_items_path, params: { order_items:
      { product_id: products(:apple).id,
        quantity: 2
   }  }
 }.must_change 'Orderitem.count', 1

 must_respond_with :redirect
 must_redirect_to product_path(products(:apple).id)

end

it "orderitem should be associated with a session" do
end

it "should not create an orderitem if it's already in the cart" do
end

it "should not create an orderitem is there is not enough quantity of product" do
  proc   {
    post order_items_path, params: { order_items:
      { product_id: products(:apple).id,
        quantity: 6
   }  }
 }.must_change 'Orderitem.count', 0
end

it "should update the quantity in the cart" do
end

it "should delete an orderitem" do
end

end
