module ProblemsHelper
    def this_problems_solution(prob)
        byebug
      if !prob.solutions.empty?
        prob.solutions.first.solution
      else
        render partial: 'solutions_form', locals: {solution: prob.solutions.build} 
      end
    end
end