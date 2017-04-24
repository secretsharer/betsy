class CartsController < ApplicationController
  def show
    @order_items = current_order.orderitems
  end
end
