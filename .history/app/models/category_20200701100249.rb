class Category < ApplicationRecord
    has_many :inventions
    has_many :users, through: :inventions
end
