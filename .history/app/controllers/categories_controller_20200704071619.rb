class CategoriesController < ApplicationController
  before_action :authenticate_user, on: :create

  def index
    @categories = Category.all
  end
 
  def create
    @category = Category.find_or_create_by(category_params)
    redirect_to categories_path
  end

  private
  def set_category
    Category.find_by(id: params[:id])
  end

  def category_params
    params.require(category).permit(:category)
  end
end
