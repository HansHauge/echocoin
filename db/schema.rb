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

ActiveRecord::Schema.define(version: 20151225161731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charities", force: :cascade do |t|
    t.float    "balance"
    t.string   "btc_address"
    t.float    "lifetime_contributions"
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "logo"
  end

  create_table "entries", force: :cascade do |t|
    t.string   "recipient"
    t.string   "sender"
    t.string   "status",     default: "pending"
    t.float    "total"
    t.integer  "charity_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "prize_pools", force: :cascade do |t|
    t.string   "btc_address"
    t.string   "name"
    t.integer  "payout_frequency"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.float    "balance"
    t.string   "btc_address"
    t.string   "btc_passwd_digest"
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
