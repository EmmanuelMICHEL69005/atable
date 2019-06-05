class AddColumnsToBookings2 < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :forkid, :string
  end
end
