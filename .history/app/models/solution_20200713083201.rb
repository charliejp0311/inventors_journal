class Solution < ApplicationRecord
    has_one :problem
    validates :solution, {presence: true, message: "YOu must have a solution to create a solution!"}
end
