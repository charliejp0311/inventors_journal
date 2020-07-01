class Problem < ApplicationRecord
    belongs_to :invention
    has_and_belongs_to_many :solutions
end
