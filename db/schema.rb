# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151116181207) do

  create_table "owners", force: :cascade do |t|
    t.string   "name"
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "owners", ["email"], name: "index_owners_on_email", unique: true

  create_table "reservations", force: :cascade do |t|
    t.string   "email"
    t.datetime "time"
    t.text     "message"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "reservations", ["restaurant_id"], name: "index_reservations_on_restaurant_id"

  create_table "restaurants", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.string  "full_address"
    t.string  "phone_number"
    t.integer "owner_id"
  end

  add_index "restaurants", ["owner_id"], name: "index_restaurants_on_owner_id"

end
