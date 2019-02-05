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

ActiveRecord::Schema.define(version: 2019_02_05_051237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favoritestores", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_favoritestores_on_store_id"
    t.index ["user_id"], name: "index_favoritestores_on_user_id"
  end

  create_table "labelinfos", force: :cascade do |t|
    t.float "thcperc"
    t.float "cbdperc"
    t.string "harvestdate"
    t.integer "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "caption"
    t.integer "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
  end

  create_table "photoupvotes", force: :cascade do |t|
    t.bigint "photo_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id"], name: "index_photoupvotes_on_photo_id"
    t.index ["user_id"], name: "index_photoupvotes_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "producttype"
    t.integer "store_id"
    t.integer "user_id"
    t.string "storetype"
    t.string "title"
    t.text "comment"
    t.integer "visualrating"
    t.integer "odorrating"
    t.integer "tasterating"
    t.float "ratingavg"
    t.string "strainname"
    t.string "straintype"
  end

  create_table "stores", force: :cascade do |t|
    t.string "storename"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "userlocations", force: :cascade do |t|
    t.string "address"
    t.float "longitude"
    t.float "latitude"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "favoritestores", "stores"
  add_foreign_key "favoritestores", "users"
  add_foreign_key "photoupvotes", "photos"
  add_foreign_key "photoupvotes", "users"
end
