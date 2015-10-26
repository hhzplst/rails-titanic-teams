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

ActiveRecord::Schema.define(version: 20151025192012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "nasas", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "superhero_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "nasas", ["superhero_id"], name: "index_nasas_on_superhero_id", using: :btree
  add_index "nasas", ["team_id"], name: "index_nasas_on_team_id", using: :btree

  create_table "superheros", force: :cascade do |t|
    t.string   "name"
    t.string   "height"
    t.string   "bio"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_srocks", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "superhero_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "t_srocks", ["superhero_id"], name: "index_t_srocks_on_superhero_id", using: :btree
  add_index "t_srocks", ["team_id"], name: "index_t_srocks_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "password_digest"
    t.boolean  "is_admin",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_foreign_key "nasas", "superheros"
  add_foreign_key "nasas", "teams"
  add_foreign_key "t_srocks", "superheros"
  add_foreign_key "t_srocks", "teams"
  add_foreign_key "teams", "users"
end
