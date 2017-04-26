class ReviewsController < ApplicationController
skip_before_action :require_login
before_action :check_merchant


def create
  @review = Review.create review_params
  redirect_back(fallback_location: root_path)
end


def check_merchant
  product_merchant = Product.find_by_id(params[:reviews][:product_id]).merchant
  if product_merchant.id == current_merchant.id
    flash[:error] = "**You cannot review your own product**"
    redirect_to :back
  end
end


private

def review_params
  params.require(:reviews).permit(:rating, :description, :product_id)
end

end
