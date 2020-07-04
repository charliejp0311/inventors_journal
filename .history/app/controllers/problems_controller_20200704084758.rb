class ProblemsController < ApplicationController

    def show
    end
    
    def create

    end
    
    def destroy
    end

    private
    def problem_params
        params.require(problem).permit(
            :problem,
            :invention_id
        )
    end

end