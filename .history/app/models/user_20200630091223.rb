class User < ApplicationRecord
    ## user can create their own invention through this relationship
    ## as well as the instructions being related to the user
    has_many :inventions
    has_many :instructions, through: :inventions

end
