class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.text :conversation
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
