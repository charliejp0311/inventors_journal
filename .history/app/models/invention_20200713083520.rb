class Invention < ApplicationRecord
    ## inventions belongs to a user and a category
    belongs_to :category
    belongs_to :user
    ### an invention is really a large solution to a problem so an invention can have many problems
    ### and because solutions are connected to problems 
    has_many :problems
    has_many :solutions, through: :problems

    accepts_nested_attributes_for :category
    validates :title, {presence: true, message: "Please give your invention a title."}
    validates :goal, {presence: true, message: "Please provide the goal of your invention."}

    def self.most_inventions
        count(:all, :group => 'user_id', :order => 'count(*) DESC').first
    end
end