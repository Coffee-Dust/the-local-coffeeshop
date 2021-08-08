# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
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
