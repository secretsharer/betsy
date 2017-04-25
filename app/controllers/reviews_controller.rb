class ReviewsController < ApplicationController

def create
  @review = Review.create review_params
  redirect_to product_path(params[:product_id])
end




private

def review_params
  params.require(:review).permit(:rating, :description)
end

end
