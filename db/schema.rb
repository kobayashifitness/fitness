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

ActiveRecord::Schema.define(version: 20160927082831) do

  create_table "diaries", force: true do |t|
    t.float    "weight"
    t.integer  "num"
    t.integer  "set"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "event"
  end

  create_table "events", force: true do |t|
    t.string   "event_name"
    t.string   "class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", force: true do |t|
    t.integer  "user_id"
    t.string   "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "heights", force: true do |t|
    t.float    "height"
    t.string   "datetime"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "muscle_masses", force: true do |t|
    t.integer  "profile_id"
    t.float    "muscle_mass"
    t.float    "l_arm"
    t.float    "r_arm"
    t.float    "l_leg"
    t.float    "r_leg"
    t.float    "body"
    t.float    "fat"
    t.string   "datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mymenus", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personals", force: true do |t|
    t.integer  "age"
    t.string   "datetime"
    t.float    "fat"
    t.string   "goal"
    t.float    "height"
    t.float    "muscle"
    t.string   "name"
    t.string   "sex"
    t.float    "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.string   "sex"
    t.string   "birthday"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "sex"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "weights", force: true do |t|
    t.float    "weight"
    t.string   "datetime"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
