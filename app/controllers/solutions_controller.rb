class SolutionsController < ApplicationController
  before_action :authenticate_user
  def create
    byebug
    @problem = Problem.find_by(params[:solution][:problem_id])
    @invention = Invention.find_by(params[:solution][:invention_id])
    @solution = Solution.new(solution: params[:solution][:solution])
    if @solution.save
      link = ProblemSolution.new(problem_id: @problem.id, solution_id: @solution.id)
      if link.save
        @problem.problem_solution_ids << link.id
        redirect_to user_invention_path(@invention.user, @invention)
      else
        byebug
      end
    else
      redirect_to invention_path(@invention)
    end
  end


end
