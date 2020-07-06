class ProblemsController < ApplicationController

    def show
    end
    
    def create
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
        params.require(:problem).permit(:problem, :invention_id)
    end
    
    def problem_has_solution?
      if self.solution
        render partial: 'views/inventions/solution_form', locals: {solution: prob.solution}
      else
        render partial: 'views/inventions/solution_form', locals: {solution: prob.solutions.build}
    end

end