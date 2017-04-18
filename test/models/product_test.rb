require "test_helper"

describe Product do
  let(:product) { Product.new }

  it "you can create a new Product" do
    product.name = "TestName"
    product.price = 5.00
    product.quantity = 4
    product.valid?.must_equal true
  end

  it "must have name present in product" do
    products(:apple).valid?.must_equal true
    products(:no_name).valid?.must_equal false
  end

  it "must have a unique name" do
    products(:not_unique).valid?.must_equal false
  end
end
