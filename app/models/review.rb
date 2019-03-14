class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :coffeeshop
    has_many :comments
end