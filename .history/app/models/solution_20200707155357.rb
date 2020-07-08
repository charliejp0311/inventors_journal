class Solution < ApplicationRecord
    belongs_to :invention
    has_many :problem_solutions
    has_many :problems, through: :problem_solutions
end
