module ProblemsHelper
    def this_problems_solution(prob)
        if !prob.solutions.empty?
            prob.solutions[0].solution
        else
            render partial: 'solutions_form', locals: {solution: prob.solutions.build} 
        end
    end
end