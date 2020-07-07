class Solution < ApplicationRecord
    has_many :problems_solutions
    has_many :problems, through: :problems_solutions
end
