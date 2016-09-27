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

ActiveRecord::Schema.define(version: 20160927083143) do

  create_table "muscle_dialies", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.float    "wight"
    t.integer  "num"
    t.integer  "set_num"
    t.string   "date"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "muscle_of_events", force: true do |t|
    t.string   "event_id"
    t.string   "muscle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "muscle_tasks", force: true do |t|
    t.integer  "event_id"
    t.integer  "mymenu_id"
    t.float    "wight"
    t.integer  "num"
    t.integer  "set_num"
    t.string   "day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "muscles", force: true do |t|
    t.string   "part"
    t.string   "recove_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mymenus", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proteins", force: true do |t|
    t.integer  "user_id"
    t.integer  "protein_intake"
    t.string   "datetime"
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

end
