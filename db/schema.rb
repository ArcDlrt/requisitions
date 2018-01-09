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

ActiveRecord::Schema.define(version: 20180109164404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name",       limit: 50, default: "", null: false
    t.string   "second_name",      limit: 50
    t.string   "second_last_name", limit: 50
    t.string   "first_last_name",  limit: 50, default: "", null: false
    t.date     "birth_date",                               null: false
    t.string   "curp",             limit: 18, default: "", null: false
    t.string   "rfc",              limit: 13, default: "", null: false
    t.string   "gender",           limit: 1
    t.string   "birth_state",      limit: 50
    t.string   "phone_number",     limit: 20, default: "", null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "requisitions", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "income",                          precision: 12, scale: 2, default: 0.0, null: false
    t.integer  "address_years",                                            default: 0,   null: false
    t.integer  "company_years",                                            default: 0,   null: false
    t.string   "marital_status",       limit: 15
    t.decimal  "requested_amount",                precision: 12, scale: 2, default: 0.0, null: false
    t.integer  "payment_terms",                                            default: 0,   null: false
    t.string   "bank",                 limit: 70,                                        null: false
    t.text     "comment"
    t.string   "company_name",         limit: 70
    t.string   "company_phone_number", limit: 20
    t.integer  "dependents_number",                                                      null: false
    t.string   "company_position"
    t.boolean  "has_sgmm"
    t.boolean  "has_imss"
    t.boolean  "has_car"
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
