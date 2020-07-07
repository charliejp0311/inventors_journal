module ProblemsHelper
    def this_problems_solution(prob)
        if !prob.solutions.empty?
            prob.solutions.each do |s|
                byebug
                s.solution
            end
        else
            render partial: 'solutions_form', locals: {solution: Solution.new} 
        end
    end
end