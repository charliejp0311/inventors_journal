class SolutionsController < ApplicationController
  before_action :authenticate_user
  def create
    @problem = Problem.find_by(params[:solution][:problem_id])
    @invention = Invention.find_by(params[:solution][:invention_id])
    @solution = Solution.new(solution: params[:solution][:solution])
    if @solution.save
      link = ProblemsSolution.new(problem_id: @problem.id, solution_id: @solution.id)
      if link.save
        redirect_to user_invention_path(@invention.user, @invention)
      else
        link.errors
      end
    else
      redirect_to invention_path(@invention)
    end
  end

end
