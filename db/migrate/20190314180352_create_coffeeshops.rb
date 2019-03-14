class CreateCoffeeshops < ActiveRecord::Migration[5.2]
	def change
		create_table :coffeeshops do |t|
			t.string :name
			t.string :picture_url
			t.string :description
			t.string :hours
			t.string :website_url
			t.string :phone
			t.string :street_address

			t.integer :location_id
		end
	end
end
