class User < ApplicationRecord
    ## user can create their own invention through this relationship
    ## as well as the instructions being related to the user
    has_many :inventions
    has_many :instructions, through: :inventions
    ### User security
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    validates :password, presence: true 

    def self.link_to_inventions(id)
        if User.find_by(id: id)
            link_to User.find_by(id: id).name, user_inventions_path(User.find_by(id: id))
        end
    end

    
end
