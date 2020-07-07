module ProblemsHelper
    def this_problems_solution(prob)
        byebug
        if !prob.solutions.empty?
            prob.problem_solution_ids.each do |s_id|
                Solution.find_by(id: s_id).solution
            end
        else
            render partial: 'solutions_form', locals: {solution: Solution.new} 
        end
    end
end