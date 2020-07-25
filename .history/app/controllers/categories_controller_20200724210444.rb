class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  def index
    @categories = Category.all
  end
  def show
    if params[:query]
      @inventions = Invention.where(category_id: @category.id).search(params[:query])
    else
      @invention = Invention.all
    end
  end

  private
  def set_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(category).permit(:category)
  end
end
