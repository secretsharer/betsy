class OrdersController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update]
  #before_action :require_login

  def new
    @order = Order.new
  end

  def show
    @order = Order.find_by_id params[:id]
    # @orderitems = current_order.orderitems
  end

  def edit; end

  def update
    orderitem_id = params[:id]
    quantity = params[:quantity]
    session[:cart][orderitem_id] += quantity
  end

  def create
    
  end

  def destroy; end

  def add_orderitem
    orderitem_id = params[:id]
    quantity = params[:quantity] || 1
    session[:cart][orderitem_id] += quantity
  end

  def remove_items
    orderitem_id = params[:id]
    session[:cart].delete orderitem_id
  end

  def empty
    session[:cart] = Cart.new
  end

  def update_quantity(product_id, quantity)
    oi = orderitems.find_by_product_id(product_id)
    oi.update_attributes! :quantity => quantity
  end

  def checkout
  @order = Order.create params[:id]
  redirect_to payment_path

  end

  private

  def order_params
    params.require(:order).permit(:id, :session_id, :quantity, :merchant_id)
  end
end
