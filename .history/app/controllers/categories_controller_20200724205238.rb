class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  def index
    @categories = Category.all
  end
  def show
    byebug
    @inventions = Invention.where(category_id: @category.id).search()
  end

  private
  def set_category
    Category.find_by(id: params[:id])
  end

  def category_params
    params.require(category).permit(:category, :query)
  end
end
