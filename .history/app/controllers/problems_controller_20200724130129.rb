class ProblemsController < ApplicationController
    before_action :authenticate_user, :set_problem
    skip_before_action :set_problem, only: [:create ]
    def show
    end

    def create
        @problem = Problem.new(problem_params)
        byebug
        if @problem.save
            @problem.invention_id = session[:invention_id]
            redirect_to user_inventions_path(@problem.invention.user, @problem.invention)
        else
            session[:flash] = "Problem not saved."
            redirect_to "users/#{session[:user_id]}/inventions/#{session[:invention_id]}"
        end
        ###fill in 
    end

    def destroy
        @invention = @problem.invention
        @problem.destroy
        redirect_to user_invention_path(@invention.user, @invention)
    end
    
    private
    def problem_params
        params.require(:problem).permit(:problem)
    end

    def set_problem
        @problem = Problem.find_by(id: params[:id])
    end
end