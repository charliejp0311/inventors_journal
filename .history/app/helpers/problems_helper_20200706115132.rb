module ProblemsHelper
    extend ActiveSupport::Helpers

    def this_problems_solution(prob)
      if !prob.solutions.empty?
        prob.solutions.first.solution
      else
        render partial: 'views/inventions/solution_form', locals: {solution: prob.solutions.build} 
      end
    end
end