class CreateReviews < ActiveRecord::Migration[5.2]
	def change
		create_table :reviews do |t|
			t.string :title
			t.text :content
			t.string :rating

			t.integer :user_id
			t.integer :coffeeshop_id
		end
    end
end
