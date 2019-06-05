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

ActiveRecord::Schema.define(version: 2019_05_29_004802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "user_name"
    t.string "status"
    t.bigint "acct_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "acct_type"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "status"
    t.string "title"
    t.money "cost", scale: 2
    t.datetime "start"
    t.text "cancellation_reason"
    t.boolean "refunded"
    t.bigint "employee_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["employee_id"], name: "index_bookings_on_employee_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.string "phone"
    t.text "bio"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "title"
    t.datetime "start"
    t.datetime "end"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_schedules_on_employee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.integer "role"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bookings", "clients"
  add_foreign_key "bookings", "employees"
  add_foreign_key "clients", "users"
  add_foreign_key "employees", "users"
  add_foreign_key "schedules", "employees"
  add_foreign_key "users", "accounts"
end
