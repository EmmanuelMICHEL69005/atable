class AddColumnsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :fourchette_id, :string
  end
end
