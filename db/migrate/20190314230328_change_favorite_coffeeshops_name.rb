class ChangeFavoriteCoffeeshopsName < ActiveRecord::Migration[5.2]
  def change
    rename_table :favorite_coffeeshops, :favorited_coffeeshops
  end
end
