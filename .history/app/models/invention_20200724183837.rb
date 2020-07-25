class Invention < ApplicationRecord
    scope :user_invention_count, -> {group(:user).count.sort_by{|k,v|-v}}
    scope :category_invention_count, -> {group(:category).count.sort_by {|k, v| -v}}
    ## inventions belongs to a user and a category
    belongs_to :category
    belongs_to :user
    ### an invention is really a large solution to a problem so an invention can have many problems
    ### and because solutions are connected to problems 
    has_many :problems
    has_many :solutions, through: :problems

    accepts_nested_attributes_for :category
    validates :title, presence: true
    validates :goal, presence: true

    def self.invention_search
        where('title like ?', "%#{params[:query]}%")
    end
    

end
