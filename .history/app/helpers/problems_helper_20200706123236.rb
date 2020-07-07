module ProblemsHelper
    def this_problems_solution(prob)
        if !prob.solutions.empty?
            byebug
            prob.solutions.first.solution
        elsif 
            render partial: 'solutions_form', locals: {solution: prob.solutions.build} 
        end
    end
end