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

ActiveRecord::Schema.define(:version => 20120614021428) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.text     "body_html"
    t.string   "url"
    t.text     "description"
    t.datetime "date_published"
    t.integer  "source_id"
    t.integer  "twitter_shares"
    t.integer  "facebook_shares"
    t.integer  "google_plus_shares"
    t.boolean  "active",             :default => true
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "articles", ["source_id"], :name => "index_articles_on_source_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "slug"
  end

  add_index "categories", ["slug"], :name => "index_categories_on_slug"

  create_table "sources", :force => true do |t|
    t.string   "screen_name"
    t.boolean  "active",            :default => true
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "category_id"
    t.integer  "twitter_id"
    t.string   "name"
    t.string   "location"
    t.string   "description"
    t.string   "url"
    t.datetime "date_registration"
    t.string   "lang"
    t.string   "profile_image_url"
  end

  add_index "sources", ["category_id"], :name => "index_sources_on_category_id"
  add_index "sources", ["screen_name"], :name => "index_sources_on_screen_name", :unique => true

  create_table "twits", :force => true do |t|
    t.datetime "created_at"
    t.integer  "twit_id",       :limit => 8
    t.string   "text"
    t.integer  "retweet_count"
    t.boolean  "favorited"
    t.boolean  "retweeted"
    t.integer  "source_id"
    t.boolean  "processed",                  :default => false
  end

  add_index "twits", ["source_id"], :name => "index_twits_on_source_id"
  add_index "twits", ["twit_id"], :name => "index_twits_on_twit_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "active",                 :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
