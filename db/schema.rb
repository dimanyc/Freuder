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

ActiveRecord::Schema.define(version: 20150210000345) do

  create_table "messages", force: true do |t|
    t.text     "body"
    t.string   "author"
    t.string   "hashtags"
    t.string   "author_image_url"
    t.string   "mentions"
    t.text     "slipped"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["owner_id", "owner_type"], name: "index_messages_on_owner_id_and_owner_type"

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
