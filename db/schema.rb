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

ActiveRecord::Schema.define(version: 2019_03_22_201835) do

  create_table "coffeeshops", force: :cascade do |t|
    t.string "name"
    t.string "picture_url"
    t.string "description"
    t.string "hours"
    t.string "website_url"
    t.string "phone"
    t.string "street_address"
    t.integer "location_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "review_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.integer "coffeeshop_id"
  end

  create_table "favorited_coffeeshops", force: :cascade do |t|
    t.integer "user_id"
    t.integer "coffeeshop_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "rating"
    t.integer "user_id"
    t.integer "coffeeshop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
    t.boolean "admin"
  end

end
