class ProblemsController < ApplicationController
    before_action :authenticate_user, :set_problem
    skip_before_action :set_problem, only: [:create ]
    def show
    end


    def create
        @problem = Problem.new(problem_params)
        if @problem.save
            redirect_to user_inventions_path(@problem.invention.user, @problem.invention)
        else
            redirect_to "users/#{session[:user_id]}/inventions/#{session[:invention_id]}"
        end
    end

    def destroy
        @invention = @problem.invention
        @problem.destroy
        redirect_to user_invention_path(@invention.user, @invention)
    end
    
    private
    def problem_params
        params.require(:problem).permit(:problem, :invention_id)
    end

    def set_problem
        @problem = Problem.find_by(id: params[:id])
    end
end