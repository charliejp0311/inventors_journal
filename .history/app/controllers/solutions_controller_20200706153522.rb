class SolutionsController < ApplicationController
  before_action :authenticate_user
  def create
    @problem = Problem.find_by(params[:solution][:problem_id])
    @solution = Solution.new(solution: params[:solution][:solution])
    @invention = Invention.find_by(params[:solution][:invention_id])
    if @solution.save
      ProblemsSolution.new(@problem.id,@solution.id)
      redirect_to user_invention_path(@invention.user, @invention)
    else
      redirect_to invention_path(@invention)
    end
  end

end
