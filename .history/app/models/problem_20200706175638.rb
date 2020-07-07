class Problem < ApplicationRecord
    belongs_to :invention
    has_many :problem_solutions
    has_many :solutions, through: :problem_solutions 
end
