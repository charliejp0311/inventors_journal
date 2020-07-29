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
    @solution = set_solution
    @problem = @solution.problem 
    @solution.destroy
    redirect_to "/inventions/#{@problem.invention.id}/problems/#{@problem.id}"
  end

  private
  def set_solution
  Solution.find_by(id: params[:id])
  end
  def solution_params
    params.require(:solution).permit(:solution,:problem_id)
  end
end
