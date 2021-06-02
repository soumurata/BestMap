class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.decimal :lat
      t.decimal :lng
      t.string :name

      t.timestamps
    end
  end
end
