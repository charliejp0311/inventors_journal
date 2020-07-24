class SolutionsController < ApplicationController
  before_action :authenticate_user

  def create
    @solution = Solution.new(solution_params)
    p = Problem.find_by(id: @solution.problem_id)
    if @solution.save
      p.solution = @solution 
      redirect_to user_invention_path(@solution.problem.invention.user, @solution.problem.invention)
    else
        redirect_to "users/#{session[:user_id]}/inventions/#{session[:invention_id]}"
    end
  end

  def destroy
    ### fill this in 
    
  end

  private
  def solution_params
    params.require(:solution).permit(:solution,:problem_id)
  end
end
