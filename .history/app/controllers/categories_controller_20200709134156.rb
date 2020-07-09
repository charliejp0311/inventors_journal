class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end
  def show
    @category = set_category
  end

  private
  def set_category
    Category.find_by(id: params[:id])
  end

  def category_params
    params.require(category).permit(:category)
  end
end
