class OrdersController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update]
  #before_action :require_login



  def new
    @order = Order.new
  end

  def show
    @order = Order.find_by_id[params(:id)]
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

  def checkout
    #run through each product, check that quantity of orderitem against stock, reduce quantity of product if okay
    #redirect to confirmation page
    #must save information of an order to be accessible by merchant
  end

  private

  def order_params
    params.require(:order).permit(:id, :session_id, :quantity, :merchant_id)
  end
end
