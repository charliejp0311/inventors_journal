class Problem < ApplicationRecord
    belongs_to :invention
    has_one :solution
    validates :problem, presence: true
end
