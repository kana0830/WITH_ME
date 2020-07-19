class ChangeNullToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :image_id, :string
    change_column :users, :gender, :integer
    change_column :users, :address, :integer
    change_column :users, :age, :integer
    change_column :users, :favorite_id, :integer
    change_column :users, :introduction, :text
    change_column :users, :is_active, :boolean, default: true, null: false
  end
end
