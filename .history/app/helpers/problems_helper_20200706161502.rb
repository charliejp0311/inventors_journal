module ProblemsHelper
    def this_problems_solution(prob)
        if !prob.problems_solutions.empty?
            if prob.problems_solutions.solution_id
                @solution = Solution.find_by(id: prob.problems_solution.session_id)
            else
                byebug
                render partial: 'solutions_form', locals: {solution: Solution.new} 
            end
        else
            render partial: 'solutions_form', locals: {solution: Solution.new} 
        end
    end
end