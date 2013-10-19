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

ActiveRecord::Schema.define(version: 20131019090752) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"

  create_table "users", force: true do |t|
    t.string   "login"
  end

  create_table "ranks", force: true do |t|
    t.integer  "points"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  add_index "ranks", ["site_id"], name: "index_ranks_on_site_id", using: :btree

  create_table "screenshoots", force: true do |t|
    t.integer  "rank_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "screenshoots", ["rank_id"], name: "index_screenshoots_on_rank_id", using: :btree

  create_table "sites", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.integer  "level"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "works", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.integer  "site_id"
  end

  add_index "works", ["site_id"], name: "index_works_on_site_id", using: :btree
  add_index "works", ["team_id"], name: "index_works_on_team_id", using: :btree
end
