class Problem < ApplicationRecord
    belongs_to :invention
    has_many :problems_solutions
    has_many :solutions, through: :problems_solutions 
end
