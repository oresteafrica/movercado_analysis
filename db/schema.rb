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

ActiveRecord::Schema.define(:version => 20130320140942) do

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "codes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "app_id"
    t.string   "code"
    t.integer  "times_used", :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "codes", ["app_id"], :name => "index_codes_on_app_id"
  add_index "codes", ["user_id"], :name => "index_codes_on_user_id"

  create_table "interactions", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "app_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "interactions", ["app_id"], :name => "index_interactions_on_app_id"
  add_index "interactions", ["user_id"], :name => "index_interactions_on_user_id"

  create_table "phones", :force => true do |t|
    t.string   "number"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "phones", ["user_id"], :name => "index_phones_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "app_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["app_id"], :name => "index_roles_on_app_id"
  add_index "roles", ["user_id"], :name => "index_roles_on_user_id"

  create_table "sms", :force => true do |t|
    t.string   "body"
    t.integer  "sender_phone_id"
    t.integer  "recipient_phone_id"
    t.datetime "sent_at"
    t.integer  "app_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "sms", ["app_id"], :name => "index_sms_on_app_id"

  create_table "users", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
