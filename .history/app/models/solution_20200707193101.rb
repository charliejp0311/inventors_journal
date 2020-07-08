class Solution < ApplicationRecord
    # belongs_to :invention
    has_one :problem_solution
    has_one :problems, through: :problem_solution
end
