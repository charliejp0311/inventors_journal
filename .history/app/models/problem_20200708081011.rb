class Problem < ApplicationRecord
    belongs_to :invention
    has_one :problem_solution
    has_one :solution, through: :problem_solution
    validates :problem, presence: true 
end
