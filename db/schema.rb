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

ActiveRecord::Schema.define(version: 20150310200143) do

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

  create_table "filters_messages", id: false, force: true do |t|
    t.integer "filter_id",  null: false
    t.integer "message_id", null: false
  end

  add_index "filters_messages", ["filter_id", "message_id"], name: "index_filters_messages_on_filter_id_and_message_id", using: :btree
  add_index "filters_messages", ["message_id", "filter_id"], name: "index_filters_messages_on_message_id_and_filter_id", using: :btree

  create_table "messages", force: true do |t|
    t.text     "body"
    t.string   "author"
    t.string   "author_image_url"
    t.text     "hashtags",         default: [], array: true
    t.text     "mentions",         default: [], array: true
    t.text     "slipped",          default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tweet_id"
  end

  create_table "messages_users", id: false, force: true do |t|
    t.integer "user_id",    null: false
    t.integer "message_id", null: false
  end

  add_index "messages_users", ["message_id", "user_id"], name: "index_messages_users_on_message_id_and_user_id", using: :btree
  add_index "messages_users", ["user_id", "message_id"], name: "index_messages_users_on_user_id_and_message_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "uid"
    t.string   "provider"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "oauth_token"
    t.string   "oauth_secret"
  end

end
