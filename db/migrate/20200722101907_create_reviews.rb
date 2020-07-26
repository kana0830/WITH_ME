class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.float :star, null: false
      t.string :title, null: false
      t.text :review, null: false
      t.integer :gelande_id, null: false

      t.timestamps
    end
  end
end
