class FavoritedCoffeeshop < ActiveRecord::Base
    belongs_to :user
    belongs_to :coffeeshop
end