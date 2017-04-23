require "test_helper"

describe CategoriesController do
  describe "index" do
    it "should get index" do
      get categories_path
      must_respond_with :success
    end
  end

  describe "new" do
    it "should get new" do
      get new_category_path
      must_respond_with :success
    end
  end

  describe "create" do
    it "should be able to create a new category" do
      proc {
        post categories_path, params: { category: {name: "noises"}  }
      }.must_change 'Category.count', 1

      must_respond_with :redirect
      must_redirect_to categories_path
    end

    it "can't create a new category with invalid parameters" do
      proc {
        post categories_path, params: { category: {name: ""}  }
      }.must_change 'Category.count', 0

    end
  end
end
