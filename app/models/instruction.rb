class Instruction < ApplicationRecord
    ### instructions belong to the invention and the invention creator
    belongs_to :invention
    belongs_to :user
end
