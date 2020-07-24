class ProblemsController < ApplicationController
    before_action :authenticate_user, :set_problem
    def show
    end

    def destroy
        @invention = @problem.invention
        problem.destroy
        redirect_to user_invention_path(@invention.user, @invention)
    end
    
    private
    def set_problem
        @problem = Problem.find_by(id: params[:id])
    end
end