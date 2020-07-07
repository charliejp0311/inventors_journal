class ProblemsController < ApplicationController


    def show
    end
    
    def create
        byebug
        @problem = Problem.new(problem_params)
        if @problem.save
            @invention = @problem.invention 
            @user = @invention.user 
            redirect_to user_invention_path(@user,@invention)
        else
        end
    end
    
    def destroy
    end

    private
    def problem_params
        params.require(:problem).permit(:problem, :invention_id, :user_id)
    end

end