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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120602000819) do

  create_table "history_plans", :force => true do |t|
    t.integer  "num_sessions"
    t.datetime "last_session_date"
    t.date     "expiration_date"
    t.string   "state"
    t.integer  "client_id"
    t.integer  "product_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "invoices", :force => true do |t|
    t.date     "creation_date"
    t.date     "expiration_date"
    t.string   "city"
    t.decimal  "subtotal",        :precision => 12, :scale => 2
    t.integer  "iva"
    t.decimal  "total",           :precision => 12, :scale => 2
    t.integer  "quantity"
    t.integer  "client_id"
    t.integer  "employee_id"
    t.integer  "product_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "plans", :force => true do |t|
    t.string   "name",              :null => false
    t.text     "description"
    t.datetime "start_time",        :null => false
    t.string   "end_time_datetime", :null => false
    t.integer  "max_age"
    t.integer  "min_age"
    t.string   "type",              :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "num_sessions",                                    :null => false
    t.decimal  "price",            :precision => 12, :scale => 3, :null => false
    t.decimal  "cash_price",       :precision => 12, :scale => 3, :null => false
    t.integer  "expiration",                                      :null => false
    t.integer  "discount_pct"
    t.integer  "num_pqt_fidelity"
    t.integer  "plan_id",                                         :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "first_name",                   :null => false
    t.string   "last_name"
    t.string   "gender"
    t.string   "document",                     :null => false
    t.string   "phone"
    t.string   "address"
    t.string   "email",                        :null => false
    t.string   "password_digest",              :null => false
    t.string   "mobile"
    t.string   "company"
    t.string   "phone_company"
    t.string   "position"
    t.integer  "seat_id",                      :null => false
    t.string   "type",                         :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
  end

  create_table "schedules", :force => true do |t|
    t.time     "start_time",  :null => false
    t.time     "end_time",    :null => false
    t.date     "date",        :null => false
    t.integer  "machine_num", :null => false
    t.integer  "seat_id",     :null => false
    t.integer  "client_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "schedules", ["seat_id", "start_time", "date", "machine_num"], :name => "schedule_unique", :unique => true

  create_table "seats", :force => true do |t|
    t.string   "name",                      :null => false
    t.string   "address"
    t.string   "phone"
    t.integer  "num_machines",              :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "seat_picture_file_name"
    t.string   "seat_picture_content_type"
    t.integer  "seat_picture_file_size"
    t.datetime "seat_picture_updated_at"
  end

end
