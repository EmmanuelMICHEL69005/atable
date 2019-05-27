class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :name
      t.string :restaurant_phone_number
      t.integer :capacity

      t.timestamps
    end
  end
end
