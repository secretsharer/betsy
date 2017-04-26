class ReviewsController < ApplicationController
skip_before_action :require_login

def create
  review = Review.create review_params
  redirect_back(fallback_location: root_path)
end




private

def review_params
  params.require(:reviews).permit(:rating, :description, :product_id)
end

end
