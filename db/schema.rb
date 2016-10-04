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

ActiveRecord::Schema.define(version: 20161002204656) do

  create_table "calls", force: :cascade do |t|
    t.boolean  "will_visit"
    t.boolean  "answer"
    t.integer  "operator_id"
    t.integer  "contact_id"
    t.datetime "call_time"
    t.text     "obs"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "calls", ["contact_id"], name: "index_calls_on_contact_id"
  add_index "calls", ["operator_id"], name: "index_calls_on_operator_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "parents"
    t.string   "phonenumber1"
    t.string   "phonenumber2"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "phonenumber3"
    t.string   "campaign"
    t.string   "school"
    t.string   "email"
  end

  create_table "operators", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visits", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "operator_id"
    t.string   "clerk"
    t.datetime "date_must_come"
    t.datetime "date_came"
    t.boolean  "signed_contract"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "obs"
  end

  add_index "visits", ["contact_id"], name: "index_visits_on_contact_id"
  add_index "visits", ["operator_id"], name: "index_visits_on_operator_id"

end
