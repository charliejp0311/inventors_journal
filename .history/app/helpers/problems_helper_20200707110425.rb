module ProblemsHelper
    def this_problems_solution(prob)
        if !prob.solutions.empty?
            prob.solutions.each do |s_id|
                byebug
                Solution.find_by(id: s_id).solution
            end
        else
            render partial: 'solutions_form', locals: {solution: Solution.new} 
        end
    end
end