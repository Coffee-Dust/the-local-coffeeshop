class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :coffeeshop
    has_many :comments

    validates_presence_of :title, :content, :rating, :coffeeshop, :user
end