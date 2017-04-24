class OrdersController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update]
  #before_action :require_login




    def index
      @orders = Order.all
    end

    def show

       #@orderitems = current_order.orderitems
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

  def create

  end

  def destroy

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
