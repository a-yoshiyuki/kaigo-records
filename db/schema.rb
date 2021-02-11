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

ActiveRecord::Schema.define(version: 2021_02_11_124552) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "is_deleted", default: 0, null: false
  end

  create_table "meal_records", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "staff_member_id", null: false
    t.integer "breakfast_main_amount", default: 0, null: false
    t.integer "breakfast_side_amount", default: 0, null: false
    t.integer "lunch_main_amount", default: 0, null: false
    t.integer "lunch_side_amount", default: 0, null: false
    t.integer "dinner_main_amount", default: 0, null: false
    t.integer "dinner_side_amount", default: 0, null: false
    t.integer "water_amount", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progress_records", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "staff_member_id", null: false
    t.time "time", null: false
    t.text "detail", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.string "address", default: "", null: false
    t.string "telephone_number", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_staff_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staff_members_on_reset_password_token", unique: true
  end

  create_table "vital_records", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "staff_member_id", null: false
    t.time "time", null: false
    t.string "body_temperature", default: "0", null: false
    t.string "heart_rate", default: "0", null: false
    t.string "oxygen", default: "0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "blood_pressure_high", default: "0", null: false
    t.string "blood_pressure_low", default: "0", null: false
  end

end
