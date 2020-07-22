class AddLatitudeColumnsToGelandes < ActiveRecord::Migration[5.2]
  def change
    add_column :gelandes, :latitude, :float
    add_column :gelandes, :longitude, :float
  end
end
