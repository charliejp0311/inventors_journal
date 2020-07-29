class SolutionsController < ApplicationController
  before_action :authenticate_user

  def create
    @solution = Solution.new(solution_params)
    if @solution.save
      redirect_to user_invention_path(@solution.problem.invention.user, @solution.problem.invention)
    else
        redirect_to "users/#{session[:user_id]}/inventions/#{session[:invention_id]}"
    end
  end

  def destroy
    byebug
    
  end

  private
  def solution_params
    params.require(:solution).permit(:solution,:problem_id)
  end
end
