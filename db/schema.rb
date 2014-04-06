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

ActiveRecord::Schema.define(version: 20140406232752) do

  create_table "campaigns", force: true do |t|
    t.integer  "organization_id"
    t.string   "pilot_number"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", force: true do |t|
    t.string   "token"
    t.integer  "sender_id"
    t.integer  "organization_id"
    t.string   "recipient_email"
    t.boolean  "used",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "password_digest"
    t.string   "auth_token"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
