class Solution < ApplicationRecord
    has_one :problem
    validates :solution, presence: true
end
