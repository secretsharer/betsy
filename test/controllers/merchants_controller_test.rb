require "test_helper"

describe MerchantsController do
<<<<<<< HEAD

  it "should get index" do
    get merchants_path
    must_respond_with :success
  end

  it "should show one merchant" do
    get merchant_path(merchants(:dan))
    must_respond_with :success
  end

  it "should show 404 if merchant not found" do
    get merchant_path(305)
    must_respond_with :missing
  end

  it "should get edit" do
    #is this test right?
    get merchant_path(merchants(:dan))
    must_respond_with :success
  end

  it "should show the new merchant form" do
    get new_merchant_path
    must_respond_with :success
  end

  it "should redirect to merchant index after adding a valid merchant" do
    post merchants_path params: {merchant:
      { username: "peeves",
        email: "peeves@hogwarts.com"
      }
    }
    must_redirect_to merchants_path
  end

  it "should render the page if the new merchant info is not valid" do
    skip
  end

  it "should affect the model when adding a merchant" do
    proc {
      post merchants_path params: {merchant:
        { username: "peeves",
          email: "peeves@hogwarts.com",
          description: "Products for obnoxious yet discerning ghosts"
        }
      }
    }.must_change 'Merchant.count', 1
  end

  it "should not affect the model when trying to add an invalid merchant" do
    proc {
      post merchants_path params: {merchant:
        { 
          email: "peeves@hogwarts.com",
          description: "Products for obnoxious yet discerning ghosts"
        }
      }
    }.must_change 'Merchant.count', 0
  end

  it "should delete a merchant and redirect to merchant list" do
    delete merchant_path(merchants(:dan))
    must_redirect_to merchants_path
  end
=======
  # it "should get index" do
  #   get merchants_path
  #   value(response).must_be :success?
  # end
>>>>>>> 1f8e3819ad09aabcc045eed6e1092e26a99574e2

end
