class Solution < ApplicationRecord
    belongs_to :problem
    validates :solution, presence: true
end
