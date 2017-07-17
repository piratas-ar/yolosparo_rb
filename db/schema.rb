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

ActiveRecord::Schema.define(version: 8) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "role"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "authorized_voices", force: :cascade do |t|
    t.string   "name"
    t.text     "quote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "title"
    t.string   "slogan"
    t.text     "description"
    t.string   "photo"
    t.text     "objective"
    t.integer  "model_text_id"
    t.integer  "authorized_voice_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "hashtag"
    t.string   "twitter_id"
  end

  create_table "legis", force: :cascade do |t|
    t.string   "legi_type"
    t.string   "full_name"
    t.string   "user_name"
    t.string   "email"
    t.string   "picture_url"
    t.string   "district"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "party"
    t.string   "block"
    t.string   "phone"
    t.string   "address"
    t.string   "personal_phone"
    t.string   "personal_address"
    t.string   "secretary_name"
    t.string   "secretary_phone"
    t.string   "site_url"
    t.string   "twitter_account"
    t.string   "facebook_account"
    t.string   "region"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "model_texts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
