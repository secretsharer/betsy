class ReviewsController < ApplicationController

def create
  @review = Review.create review_params
  redirect_back(fallback_location: root_path)
end




private

def review_params
  params.require(:reviews).permit(:rating, :description)
end

end
