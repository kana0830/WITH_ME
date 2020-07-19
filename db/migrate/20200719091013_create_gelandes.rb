class CreateGelandes < ActiveRecord::Migration[5.2]
  def change
    create_table :gelandes do |t|
      t.string :name, null: false
      t.integer :count
      t.integer :slope
      t.integer :distance
      t.integer :postal, null: false
      t.string :address, null: false
      t.integer :tel, null: false
      t.string :hp
      t.string :image_id
      t.text :introduction, null: false
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
