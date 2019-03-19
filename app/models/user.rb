class User < ActiveRecord::Base
    has_secure_password

    has_many :reviews
    has_many :comments

    has_many :favorited_coffeeshops
    has_many :favorite_coffeeshops, through: :favorited_coffeeshops, source: :coffeeshop

    belongs_to :location

    validates_presence_of :name, :email, :password, :location

    def add_coffeeshop_to_favorites(coffeeshop)
        self.favorite_coffeeshops.push(coffeeshop)
        self.save
    end

    def remove_coffeeshop_from_favorites(coffeeshop)
        if cs = FavoritedCoffeeshop.find_by(user: self, coffeeshop: coffeeshop)
            cs.destroy
            self.reload
        end
    end



end