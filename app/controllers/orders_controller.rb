class OrdersController < ApplicationController

  class ProductsController < ApplicationController
    before_action :find_product, only: [:show, :edit, :update]
    #before_action :require_login


    def index
    end

    def new
      @product = Product.new
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

    def order_params
      params.require(:order).permit(:id, :session_id, :quantity, :merchant_id)
    end

    def find_merchant
      @merchant = Merchant.find(params[:id])
    end
  end

end
