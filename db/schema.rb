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

ActiveRecord::Schema.define(version: 20140526130831) do

  create_table "identifications", force: true do |t|
    t.integer  "soldier_id"
    t.integer  "picture_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identifications", ["picture_id"], name: "index_identifications_on_picture_id", using: :btree
  add_index "identifications", ["soldier_id"], name: "index_identifications_on_soldier_id", using: :btree
  add_index "identifications", ["user_id"], name: "index_identifications_on_user_id", using: :btree

  create_table "pictures", force: true do |t|
    t.string   "picture_url"
    t.string   "ref"
    t.string   "author"
    t.string   "place"
    t.string   "copyrights_owner"
    t.text     "description"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "soldiers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "service_number"
    t.string   "rank"
    t.string   "unit"
    t.string   "date_of_death"
    t.string   "place_of_death"
    t.string   "cemetery"
    t.string   "source"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
