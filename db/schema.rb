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

ActiveRecord::Schema.define(version: 20150324002956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deal_occurrences", force: :cascade do |t|
    t.integer  "schedulable_id"
    t.string   "schedulable_type"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "venue_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "deals", ["venue_id"], name: "index_deals_on_venue_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.integer  "schedulable_id"
    t.string   "schedulable_type"
    t.date     "date"
    t.time     "time"
    t.string   "rule"
    t.string   "interval"
    t.text     "days"
    t.text     "day_of_week"
    t.date     "until"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "zipcode"
    t.integer  "street_number"
    t.string   "website"
    t.string   "google_place_id"
  end

  add_foreign_key "deals", "venues"
end
