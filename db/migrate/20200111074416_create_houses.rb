class CreateHouses < ActiveRecord::Migration[5.2]
  
  def change
    create_table :houses do |t|
      t.string :title, limit: 100, null: false, default: ""
      t.string :house_image_id
      t.string :address, null: false, default: ""
      t.string :deposit, null: false
      t.string :key, null: false
      t.string :comment, limit: 50
      t.text :body, limit: 1000, null: false, default: ""
      t.integer :user_id
      t.integer :prefecture, null: false, default: 0
      t.integer :price, null: false
      t.integer :construction, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.datetime :deleted_at

      t.timestamps
    end
  end


end