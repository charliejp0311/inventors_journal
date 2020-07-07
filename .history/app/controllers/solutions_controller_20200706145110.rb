class SolutionsController < ApplicationController
  before_action :authenticate_user
  def create
    @problem = Problem.find_by(params[:solution][:problem_id])
    @solution = @problem.solutions.build(solution_params)
    @invention = Invention.find_by(params[:solution][:invention_id])
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
