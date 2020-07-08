class ProblemsController < ApplicationController


    def show
    end
    
    def create
        @problem = Problem.new(problem_params)
        if @problem.save
            redirect_to user_invention_path(@problem.user,@problem.invention)
        end
    end
    
    def destroy
    end

    private
    def problem_params
        params.require(:problem).permit(:problem)
    end

end