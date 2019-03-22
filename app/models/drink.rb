class Drink < ActiveRecord::Base
    belongs_to :coffeeshop
    validates_presence_of :name, :coffeeshop
end