class SolutionsController < ApplicationController
  before_action :authenticate_user
  def create
    @solution = Solution.new(solution_params)
    if @solution.save
      ProblemSolution.create(problem_id: @solution.invention.problems.last, solution_id: @solution.id)
      byebug
      redirect_to user_invention_path(@problem.user, @problem.invention)
    else
      redirect_to invention_path(@invention)
    end
  end

  private
  def solution_params
    params.require(:solution).permit(:solution, :invention_id)
  end
end
