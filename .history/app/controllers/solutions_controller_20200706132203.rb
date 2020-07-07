class SolutionsController < ApplicationController
  before_action :authenticate_user
  def create
    @invention = Invention.find_by(id: params[:invention_id])
    @solution = Solution.new(solution_params)
    if solution.save
      redirect_to user_invention_path(@invention.user, @invention)
    else
      redirect_to invention_path(@invention)
    end
  end

  private
  def solution_params
    params.require(:solution).permit(:solution, :invention_id)
  end
  
end
