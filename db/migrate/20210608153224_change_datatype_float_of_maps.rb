class ChangeDatatypeFloatOfMaps < ActiveRecord::Migration[5.2]
  def change
    change_column :maps, :latitude ,:float, precision: 11, scale:8
    change_column :maps, :longitude ,:float, precision: 11, scale:8
  end
end
