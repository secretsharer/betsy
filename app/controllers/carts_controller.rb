class CartsController < ApplicationController
  def show
    @order = Order.find_by_id(current_order)
    @order_items = @order.orderitems
  end
end
