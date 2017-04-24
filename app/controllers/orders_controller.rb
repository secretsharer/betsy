class OrdersController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update]
  #before_action :require_login

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find_by_id[params(:id)]
    # @orderitems = current_order.orderitems
  end

  def update

  end

  def add_product
    product_id = params[:id]
    quantity = params[:quantity] || 1
    session[:cart][product_id] += quantity
  end

  def update_quantity
    product_id = params[:id]
    quantity = params[:quantity]
    session[:cart][product_id] += quantity
  end

  def remove_items
    product_id = params[:id]
    session[:cart].delete product_id
  end

  def empty
    session[:cart] = Cart.new
  end

  def create

  end

  def destroy

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

  def find_order
    @order = Order.find(params[:id])
  end

  # def order_params
  #   params.require(:order).permit(:id, :session_id)
  # end

  def find_merchant
    @merchant = Merchant.find(params[:id])
  end
end
