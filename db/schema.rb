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

ActiveRecord::Schema.define(version: 20150327220018) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "intro_post_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "short_description"
    t.string   "link_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "post_id"
  end

  add_index "links", ["post_id"], name: "index_links_on_post_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "html_content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "category_id"
    t.string   "post_type"
  end

  create_table "shirts", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "link",       null: false
    t.string   "image_link", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "post_id"
  end

end
