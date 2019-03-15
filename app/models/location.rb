class Location < ActiveRecord::Base
    has_many :coffeeshops
    validates_presence_of :city, :state
end