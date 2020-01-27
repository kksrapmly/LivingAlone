class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :to_id
      t.integer :from_id

      t.timestamps
    end

    add_index :rooms, :to_id
    add_index :rooms, :from_id
    add_index :rooms, [:to_id, :from_id], unique: true
  end
end
