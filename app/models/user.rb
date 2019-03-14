class User < ActiveRecord::Base
    has_many :reviews
    has_many :comments

    has_many :favorite_coffeeshops
    has_many :favorited_coffeeshops, through: :favorite_coffeeshops, source: :coffeeshop


    
    def add_coffeeshop_to_favorites(coffeeshop)
        self.favorited_coffeeshops.push(coffeeshop)
        self.save
    end

    def remove_coffeeshop_from_favorites(coffeeshop)
        if cs = FavoriteCoffeeshop.all.detect {|c| c.user == self && c.coffeeshop == coffeeshop }
            cs.destroy
            self.reload
        end
    end



end