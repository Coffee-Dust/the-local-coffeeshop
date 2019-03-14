class CreateFavoriteCoffeeshops < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_coffeeshops do |t|
      t.integer :user_id
      t.integer :coffeeshop_id
    end
  end
end
