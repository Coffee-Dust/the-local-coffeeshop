class Coffeeshop < ActiveRecord::Base
    belongs_to :location
    has_many :reviews

    has_many :popular_drinks, class_name: "Drink"


    def sort_popular_drinks
        count = self.popular_drinks.group("name").count
        names_in_order = count.sort_by{|key, value| value}.reverse.collect{|key,value|key}

        return names_in_order
    end

    def rating
        r = self.reviews.average("rating")
        sprintf("%.1f", r)
    end

end