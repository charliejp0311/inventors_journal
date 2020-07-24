class SolutionsController < ApplicationController
  before_action :authenticate_user
  def create
    byebug
    @solution = Solution.new(solution_params)
    if @solution.save
        @solution.invention_id = session[:invention_id]
        redirect_to user_inventions_path(@solution.invention.user, @solution.invention)
    else
        redirect_to "users/#{session[:user_id]}/inventions/#{session[:invention_id]}"
    end
  end

  def destroy
    ### fill this in 
    
  end

  private
  def solution_params
    params.require(:solution).permit(:solution)
  end
end
