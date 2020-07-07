module ProblemsHelper
    def this_problems_solution(prob)
        if !prob.problems_solutions.empty?
            byebug
            prob.solutions.first.solution
        else
            render partial: 'solutions_form', locals: {solution: Solution.new} 
        end
    end
end