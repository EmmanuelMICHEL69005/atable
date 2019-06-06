class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :date
      t.string :nature
      t.string :content
      t.references :user, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
