class Invention < ApplicationRecord
    ## inventions belongs to a user and has many instructions
    belongs_to :user
    has_many :instructions 
    ## inventions can be commented on and have many users that have commented on them
    has_many :comments
    #has_many :users, through: :comments ## not sure if this will work
end
