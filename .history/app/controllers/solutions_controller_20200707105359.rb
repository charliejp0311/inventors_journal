class SolutionsController < ApplicationController
  before_action :authenticate_user
  def create
    @problem = Problem.find_by(params[:solution][:problem_id])
    @solution = Solution.new(solution: params[:solution][:solution])

    if @solution.save
      link = ProblemSolution.new(problem_id: @problem.id, solution_id: @solution.id)
      byebug
      redirect_to user_invention_path(@problem.user, @problem.invention)
    else
      redirect_to invention_path(@invention)
    end
  end


end
