class Solution < ApplicationRecord
    has_many :problem_solutions
    has_many :problems, through: :problem_solutions
end
