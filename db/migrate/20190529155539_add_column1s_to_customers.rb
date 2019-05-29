class AddColumn1sToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :facebook_id, :string
  end
end
