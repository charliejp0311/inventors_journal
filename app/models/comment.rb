class Comment < ApplicationRecord
    ### comments belong to a user and the invention they are for 
    belongs_to :user
    belongs_to :invention
end
