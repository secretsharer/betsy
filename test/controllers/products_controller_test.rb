require "test_helper"

describe ProductsController do
  it "should get index" do
    get products_path
    must_respond_with :success
  end

  it "should get the index if merchant_id is passed as params" do
    get merchant_products_path(merchants(:dan).id)
    must_respond_with :success
  end
end
