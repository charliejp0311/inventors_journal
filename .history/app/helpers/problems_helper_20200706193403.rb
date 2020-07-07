module ProblemsHelper
    def this_problems_solution(prob)
        byebug
        if !prob.problem_solutions
            if prob.problem_solutions.solution_id
                @solution = Solution.find_by(id: prob.problem_solutions.session_id)
            else
                render partial: 'solutions_form', locals: {solution: Solution.new} 
            end
        else
            render partial: 'solutions_form', locals: {solution: Solution.new} 
        end
    end
end