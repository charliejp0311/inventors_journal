module ProblemsHelper
    def this_problems_solution(prob)
        if !prob.problems_solutions.empty?
            @solution = Solution.find_by(id: prob.problems_solution.session_id)
            byebug
            
        else
            render partial: 'solutions_form', locals: {solution: Solution.new} 
        end
    end
end