require "test_helper"

describe ReviewsController do
  it "can create a new review" do
    proc {
      post reviews_path, params: { reviews:
        { rating: 4,
          description: "This better work",
          product_id: products(:apple).id
        }
      }
    }.must_change 'Review.count', 1

    must_respond_with :found
    # must_redirect_back
  end

  it "will not allow merchant to review own products" do
    user = merchants(:dan)
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))
    get auth_callback_path(:github)

    post reviews_path, params: { reviews:
      { rating: 4,
        description: "You better work",
        product_id: products(:apple).id
      }
    }

    post reviews_path, params: { reviews:
      { rating: 4,
        description: "You better work",
        product_id: products(:apple).id
      }
    }

    must_respond_with :found
    flash[:error].must_equal "**You cannot review your own product**"
  end
end
