class Problem < ApplicationRecord
    belongs_to :invention
    has_one :solution
    validates :problem, {presence: true, message: "You must have a problem to create a problem!"} 
end
