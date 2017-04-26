class ProductsController < ApplicationController
   before_action :find_product, only: [:show, :edit, :update]
   skip_before_action :require_login, only: [:index, :show]


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

  def destroy
    Product.destroy(params[:id])

    redirect_to products_path
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new product_params
    product.merchant_id = params[:merchant_id]
    product.save

    if product.save
      redirect_to merchant_products_path(params[:merchant_id])
    end
  end



  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :merchant_id, :description, :image_url)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
