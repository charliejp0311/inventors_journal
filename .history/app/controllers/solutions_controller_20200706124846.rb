class SolutionsController < ApplicationController
  accepts_nested_attributes_for :inventions
  def create
    byebug
  end

  private
  def solution_params
    params.require(:solution).permit(:solution, :invention_id)
  end
end
