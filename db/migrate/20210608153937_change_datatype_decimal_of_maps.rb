class ChangeDatatypeDecimalOfMaps < ActiveRecord::Migration[5.2]
  def change
    change_column :maps, :latitude ,:decimal, precision: 11, scale:8
    change_column :maps, :longitude ,:decimal, precision: 11, scale:8
  end
end
