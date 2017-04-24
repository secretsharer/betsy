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

  it "should show an individual product" do
    get product_path(products(:apple).id)
    must_respond_with :success
  end

  it "should get an edit page" do
    get edit_product_path(products(:apple).id)
    must_respond_with :success
  end

  it "update should update a product or render edit" do
    patch product_path(products(:banana).id), params: {product: { quantity: 2 } }
    must_respond_with :found
    must_respond_with :redirect
    must_redirect_to product_path
  end

  it "should delete a product" do
  proc {
  delete product_path(products(:banana).id)
  }.must_change 'Product.count', -1
  end

  it "should get the new page" do
    get new_merchant_product_path(merchants(:dan).id)
    must_respond_with :success
  end

  it "should create a new product" do
    proc   {
      post merchant_products_path(merchants(:dan).id), params: { product:
        { name: "new product",
          price: 5.00,
          quantity: 2
     }  }
   }.must_change 'Product.count', 1

   must_respond_with :redirect
   must_redirect_to merchant_products_path(merchants(:dan).id)
  end

  it "should not create an invalid product" do
    proc   {
      post merchant_products_path(merchants(:dan).id), params: { product:
        { name: "new product",
          price: 5.00,
          quantity: 0
     }  }
   }.must_change 'Product.count', 0
  end

end
