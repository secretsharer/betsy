class ProductsController < ApplicationController
  def index
    if params[:merchant_id]
      merchant = Merchant.find_by(id: params[:merchant_id])
      @products = merchant.products
    else
    @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

end
