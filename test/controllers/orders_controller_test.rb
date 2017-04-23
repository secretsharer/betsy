require "test_helper"

describe OrdersController do

  it "should get cart 'index'" do
    #empty cart page presumably showing one empty cart
    get orders_path
    must_respond_with :success
  end

  it "should show orderitems if merchant (session?) has orderitems" do
    #how should this path look? products per merchant, per session?
    get order_path(merchants(:dan).id(orderitems))
    must_respond_with :success
  end

  it "adding items should update the order orderitem count" do
    #I'm guessing I don't need one of these, but here they both are.
    #patch cart_path(orderitems(:banana).id), params: {orderitem: { quantity: 3 } }
    proc {
    patch orderitem_path(products(:banana).id)
  }.must_change 'Orderitem.count', quantity: 3
  must_respond_with :redirect
  must_redirect_to order_path
  end


  it "should delete an orderitem" do
  proc {
  delete orderitem_path(products(:banana).id)
}.must_change 'Orderitem.count', -1
  end


  it "should show an individual product" do
    get product_path(orderitems(:apple).id)
    must_respond_with :success
  end

  it "should get an edit page" do
    get edit_orders_path(orderitems(:apple).id)
    must_respond_with :success
  end

end
