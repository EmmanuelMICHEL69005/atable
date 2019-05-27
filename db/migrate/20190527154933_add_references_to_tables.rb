class AddReferencesToTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :restaurant, foreign_key: true
    add_reference :bookings, :customer, foreign_key: true
    add_reference :users, :restaurant, foreign_key: true
  end
end
