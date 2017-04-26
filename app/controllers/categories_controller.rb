class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create category_params

    unless @category.id == nil
      flash[:success] = "#{@category.name} successfully created"
      redirect_to categories_path
    else
      flash.now[:error] = "Category not created; see below for specifics"
      render "new"
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
