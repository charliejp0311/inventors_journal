class ProblemsController < ApplicationController
    before_action :authenticate_user
    def show
        @problem = set_problem
    end

    def destroy
        problem = set_problem
        @invention = problem.invention
        problem.destroy
        redirect_to user_invention_path(@invention.user, @invention)
    end
    private
    def set_problem
        Problem.find_by(id: params[:id])
    end
end