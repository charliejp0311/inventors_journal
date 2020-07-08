module ProblemsHelper
    def this_problems_solution(prob)
        if prob.solution 
             prob.solution.solution 
        else 
             form_tag({controller: 'inventions', action: 'solutions', method: 'post'}) do 
             label_tag 'solution' 
             text_field_tag 'solution' <br/>
             submit_tag 'Resolve'
            end 
        end 
    end
end