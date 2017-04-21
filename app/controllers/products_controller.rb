class ProductsController < ApplicationController
   before_action :find_product, only: [:show, :edit, :update]

  def index
    if params[:merchant_id]
      merchant = Merchant.find_by(id: params[:merchant_id])
      @products = merchant.products
    else
    @products = Product.all
    end
  end

  def show; end

  def edit; end

  def update

    if @product.update product_params
      redirect_to product_path
    else
      render 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
