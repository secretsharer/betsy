require "test_helper"

describe Product do
  let(:product) { Product.new }

  it "you can create a new Product" do
    product.name = "TestName"
    product.price = 5.00
    product.quantity = 4
    product.valid?.must_equal true

  end
end
