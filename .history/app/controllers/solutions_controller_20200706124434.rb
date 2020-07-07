class SolutionsController < ApplicationController
  def create
    byebug
  end

  private
  def solution_params
    params.require(:solution).permit(:solution, :invention_id)
  end
end
