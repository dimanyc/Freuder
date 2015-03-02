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

ActiveRecord::Schema.define(version: 20150302171919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "filters", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.text     "slips"
    t.boolean  "case_sensitive"
    t.boolean  "keep_slips_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.text     "body"
    t.string   "author"
    t.string   "author_image_url"
    t.text     "hashtags",         default: [], array: true
    t.text     "mentions",         default: [], array: true
    t.text     "slipped",          default: [], array: true
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "processor_id"
    t.string   "processor_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["owner_id", "owner_type"], name: "index_messages_on_owner_id_and_owner_type", using: :btree
  add_index "messages", ["processor_id", "processor_type"], name: "index_messages_on_processor_id_and_processor_type", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "uid"
    t.string   "provider"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
