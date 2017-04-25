require "test_helper"

describe OrdersController do


  it "adding items should update the order orderitem count" do
    skip
    #I'm guessing I don't need one of these, but here they both are.
    #patch cart_path(orderitems(:banana).id), params: {orderitem: { quantity: 3 } }
    proc {
    patch orderitem_path(products(:banana).id)
  }.must_change 'Orderitem.count', quantity: 3
  must_respond_with :redirect
  must_redirect_to order_path
  end

  it "should have order items associate with it" do
  end

  it "should let you checkout an order" do
  end



  it "should show an individual product" do
    skip
    get product_path(orderitems(:apple).id)
    must_respond_with :success
  end


end
