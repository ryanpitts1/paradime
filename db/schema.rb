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

ActiveRecord::Schema.define(:version => 20130216221830) do

  create_table "attachments", :force => true do |t|
    t.integer  "attachable_id",                   :default => 0,  :null => false
    t.string   "file",            :limit => 2000, :default => "", :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "title",           :limit => 500,  :default => "", :null => false
    t.string   "attachable_type", :limit => 500,  :default => "", :null => false
  end

  create_table "listings", :force => true do |t|
    t.string   "title",              :limit => 500,                                 :default => "",    :null => false
    t.decimal  "price",                              :precision => 11, :scale => 2
    t.string   "state",              :limit => 2,                                   :default => "",    :null => false
    t.boolean  "show_email",                                                        :default => false
    t.string   "email",              :limit => 250,                                 :default => "",    :null => false
    t.boolean  "show_phones",                                                       :default => false
    t.string   "primary_phone",      :limit => 250,                                 :default => "",    :null => false
    t.string   "secondary_phone",    :limit => 250,                                 :default => "",    :null => false
    t.string   "description",        :limit => 9000,                                :default => "",    :null => false
    t.string   "listing_owner",      :limit => 250,                                 :default => "",    :null => false
    t.string   "ip_at_creation",                                                    :default => "0"
    t.string   "ip_at_modification",                                                :default => "0"
    t.datetime "created_at",                                                                           :null => false
    t.datetime "updated_at",                                                                           :null => false
    t.integer  "user_id",                                                           :default => 0,     :null => false
    t.string   "city",               :limit => 250,                                 :default => "",    :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",                    :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                   :limit => 250, :default => "",    :null => false
    t.boolean  "admin",                                 :default => false
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
