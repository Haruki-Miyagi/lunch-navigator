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

ActiveRecord::Schema.define(version: 2019_08_08_110329) do

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "gnavi_shop_id", null: false
    t.integer "score", null: false
    t.string "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gnavi_shop_id"], name: "index_reviews_on_gnavi_shop_id"
    t.index ["user_id", "gnavi_shop_id"], name: "compound_uniqueness", unique: true
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "stars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "gnavi_shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gnavi_shop_id"], name: "index_stars_on_gnavi_shop_id"
    t.index ["user_id", "gnavi_shop_id"], name: "compound_uniqueness", unique: true
    t.index ["user_id"], name: "index_stars_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "account", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account"], name: "index_users_on_account", unique: true
  end

  add_foreign_key "reviews", "users"
  add_foreign_key "stars", "users"
end
