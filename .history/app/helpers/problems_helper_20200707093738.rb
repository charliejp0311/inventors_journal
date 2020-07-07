module ProblemsHelper
    def this_problems_solution(prob)
        if !prob.problem_solution_ids.empty?
            byebug
            prob.problem_solution_ids.each do |s_id|
                Solution.find_by(id: s_id).solution
            end
        else
            render partial: 'solutions_form', locals: {solution: Solution.new} 
        end
    end
end