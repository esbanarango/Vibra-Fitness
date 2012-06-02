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

ActiveRecord::Schema.define(:version => 20120601213038) do

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "document",                     :null => false
    t.string   "phone"
    t.string   "address"
    t.string   "email",                        :null => false
    t.string   "password_digest"
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

  create_table "seats", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.integer  "num_machines"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "seat_picture_file_name"
    t.string   "seat_picture_content_type"
    t.integer  "seat_picture_file_size"
    t.datetime "seat_picture_updated_at"
  end

end
