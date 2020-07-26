class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :image_id, :string
    add_column :users, :gender, :integer
    add_column :users, :address, :integer
    add_column :users, :age, :integer
    add_column :users, :favorite_id, :integer
    add_column :users, :introduction, :text
    add_column :users, :is_active, :boolean
  end
end
