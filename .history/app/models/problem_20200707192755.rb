class Problem < ApplicationRecord
    belongs_to :invention
    belongs_to :user
    has_one :problem_solution
    has_one :solution, through: :problem_solution 
end
