require "test_helper"

describe Review do
  let(:review) { Review.new }

  it "creates a rating" do
    review.rating = 3
    review.valid?.must_equal true
  end

  it "should have rating present" do
    reviews(:has_rating).valid?.must_equal true
    reviews(:no_rating).valid?.must_equal false

  end

end
