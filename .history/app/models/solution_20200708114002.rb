class Solution < ApplicationRecord
    # belongs_to :invention
    has_one :problem
    validates :solution, presence: true
end
