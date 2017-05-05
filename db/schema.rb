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

ActiveRecord::Schema.define(version: 20170505102801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carriages", force: :cascade do |t|
    t.integer  "top_seats"
    t.integer  "bottom_seats"
    t.integer  "train_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "type"
    t.integer  "side_top_seats"
    t.integer  "side_bottom_seats"
    t.integer  "econom_seats"
    t.integer  "number"
  end

  add_index "carriages", ["id", "type"], name: "index_carriages_on_id_and_type", using: :btree
  add_index "carriages", ["train_id"], name: "index_carriages_on_train_id", using: :btree

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer  "railway_station_id"
    t.integer  "route_id"
    t.integer  "station_index"
    t.datetime "arrive_time"
    t.datetime "outgo_time"
  end

  add_index "railway_stations_routes", ["railway_station_id"], name: "index_railway_stations_routes_on_railway_station_id", using: :btree
  add_index "railway_stations_routes", ["route_id"], name: "index_railway_stations_routes_on_route_id", using: :btree

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "train_id"
    t.integer "base_station_id"
    t.integer "end_station_id"
    t.text    "user_first_name"
    t.text    "user_last_name"
    t.text    "user_middle_name"
    t.text    "user_passport"
  end

  add_index "tickets", ["base_station_id"], name: "index_tickets_on_base_station_id", using: :btree
  add_index "tickets", ["end_station_id"], name: "index_tickets_on_end_station_id", using: :btree
  add_index "tickets", ["train_id"], name: "index_tickets_on_train_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "route_id"
    t.integer  "current_station_id"
    t.boolean  "order_carriage",     default: false
  end

  add_index "trains", ["current_station_id"], name: "index_trains_on_current_station_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin"
    t.text     "first_name"
    t.text     "last_name"
  end

end
