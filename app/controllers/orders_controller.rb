class OrdersController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update]
  #before_action :require_login


  def index
  end


    def index
      @orders = Order.all
    end

    def new
      @order = Order.new
    end

    def show

       #@orderitems = current_order.orderitems
    end

  def new
  end

  def show
    @orderitems = current_order.orderitems
  end


  def edit; end

  def update

  end

  def destroy

  end



  def create


  end

  private

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
