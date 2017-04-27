class OrdersController < ApplicationController
  def show
    @order = Order.find_by_id(current_order)
    @order_items = @order.orderitems
  end

  def edit; end

  def create
    @order = Order.create
  end

  def edit; end

  def destroy; end

  def empty
    #session[:cart] = Order.new
  end

  def checkout
    


  end


end
