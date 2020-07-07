module ProblemsHelper
    def this_problems_solution(prob)
      if !prob.solutions.empty?
        prob.solutions.first.solution
      elsif prob.problem == nil
        render partial: 'solutions_form', locals: {solution: prob.solutions.build} 
      end
    end
end