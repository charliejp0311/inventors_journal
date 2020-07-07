class SolutionsController < ApplicationController
  before_action :authenticate_user
  def create
    @solution = Solution.new(solution_params)
    if @solution.save
      byebug
      redirect_to user_invention_path(@invention.user, @invention)
    else
      redirect_to invention_path(@invention)
    end
  end

  private
  def solution_params
    params.require(:solution).permit(:solution)
  end
  
end
