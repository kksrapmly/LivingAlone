# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_27_095821) do

  create_table "houses", force: :cascade do |t|
    t.string "title", limit: 100, default: "", null: false
    t.string "house_image_id"
    t.string "address", default: "", null: false
    t.string "deposit", null: false
    t.string "key", null: false
    t.string "comment", limit: 50
    t.text "body", limit: 1000, default: "", null: false
    t.integer "user_id"
    t.integer "prefecture", default: 0, null: false
    t.integer "price", null: false
    t.integer "construction", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "followed_id"
    t.integer "follower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "to_id"
    t.integer "from_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_id"], name: "index_rooms_on_from_id"
    t.index ["to_id", "from_id"], name: "index_rooms_on_to_id_and_from_id", unique: true
    t.index ["to_id"], name: "index_rooms_on_to_id"
  end

  create_table "talks", force: :cascade do |t|
    t.text "conversation"
    t.integer "room_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", limit: 50, default: "", null: false
    t.string "user_image_id"
    t.text "introduction", limit: 500, default: "", null: false
    t.integer "which", default: 0, null: false
    t.integer "sex", default: 0, null: false
    t.integer "prefecture", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
