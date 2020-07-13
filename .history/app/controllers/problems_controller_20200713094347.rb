class ProblemsController < ApplicationController
    def show
        @problem = set_problem
    end

    private
    def set_problem
        Problem.find_by(id: params[:id])
    end
end