class Invention < ApplicationRecord
    scope :user_invention_count, -> {group(:user_id).order('count_all desc').limit(3).count}
    scope :category_invention_count, -> {group(:category_id).order('count_all desc').limit(3).count}
    scope :search, -> (q) {where('title like ?', "%#{q}")}
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

    # def self.search(q)
    #     if q 
    #         where('title like ?', "%#{q}%")
    #     else
    #         all 
    #     end
    # end
    
    

end
