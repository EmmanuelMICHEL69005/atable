class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.integer :number_of_customers

      t.string :source


      t.timestamps
    end
  end
end
