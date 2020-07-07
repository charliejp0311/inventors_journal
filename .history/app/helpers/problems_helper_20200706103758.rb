module ProblemsHelper
    def this_problems_solution
      if !self.solutions.empty?
        self.solutions.first.solution
      else
        render partial: 'views/inventions/solution_form', locals: {solution: self.solutions.build} 
      end
    end
end