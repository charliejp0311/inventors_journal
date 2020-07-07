class SolutionsController < ApplicationController
  before_action :authenticate_user
  def create
    @problem = Problem.find_by(params[:solution][:problem_id])
    @invention = Invention.find_by(params[:solution][:invention_id])
    @solution = Solution.new(solution: params[:solution][:solution])
    if @solution.save
      link = ProblemsSolution.create(@problem.id , @solution.id)
      byebug
      redirect_to user_invention_path(@invention.user, @invention)
    else
      redirect_to invention_path(@invention)
    end
  end

end
