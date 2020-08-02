class ChangeColumnPostalAndTelToGelandes < ActiveRecord::Migration[5.2]
  def change
    change_column :gelandes, :tel, :string
    change_column :gelandes, :postal, :string
    remove_column :users, :favorite_id, :integer
  end
end
