class AddColumnsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :hour, :string
    add_column :bookings, :content, :string
    add_column :bookings, :status, :string
    add_column :bookings, :validation_link, :string
    add_column :bookings, :edit_link, :string
  end
end
