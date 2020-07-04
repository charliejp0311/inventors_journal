class ProblemsController < ApplicationController
    accepts_nested_attributes_for :solutions

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
            solutions_attributes: [ 
                :solution
            ]
        )
    end

end