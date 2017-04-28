class ProductsController < ApplicationController
   before_action :find_product, only: [:show, :edit, :update]
   before_action :user_matches_merchant, only: [:new, :create]
   skip_before_action :require_login, only: [:index, :show]


  def index
    #returns products that are active
    if params[:merchant_id]
      merchant = Merchant.find_by(id: params[:merchant_id])
      products = merchant.products
    elsif params[:category_id]
      category = Category.find_by(id: params[:category_id])
      products = category.products
    else
    products = Product.all
    end

    @active_products = products.select { |p| p if p.status}
  end

  def show; end

  def edit; end

  def update
    params[:product][:categories].each do |category|
      if category != ""
        @product.categories << Category.find_by_id(category)
      end
    end

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
    product.merchant_id = current_merchant.id
    params[:product][:categories].each do |category|
      if category != ""
        product.categories << Category.find_by_id(category)
      end
    end

    product.save

    if product.save
      redirect_to merchant_products_path(current_merchant.id)
    end
  end

  def product_status
    product = Product.find_by_id(params[:id])
    if product.status
      product.status = false
    else
      product.status = true
    end

    if product.save
      if !product.status
        flash[:success] = "You retired #{product.name}. It's no longer available for purchase."
      else
        flash[:success] = "You have activated #{product.name}. It's now available for purchase."

      end
      redirect_to account_products_path(current_merchant.id)
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
