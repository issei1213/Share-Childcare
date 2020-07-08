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

ActiveRecord::Schema.define(version: 2020_06_18_134302) do

  create_table "baby_infomations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "parent_id"
    t.string "name"
    t.integer "age"
    t.integer "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_baby_infomations_on_parent_id"
  end

  create_table "babysitter_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "babysitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["babysitter_id"], name: "index_babysitter_images_on_babysitter_id"
  end

  create_table "babysitters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "baby_age_range_top_month"
    t.integer "baby_age_range_top_year"
    t.integer "baby_age_range_down_year"
    t.integer "baby_age_range_down_month"
    t.integer "number_of_baby", default: 0
    t.integer "experience_year"
    t.integer "experience_support_count", default: 0
    t.integer "experience_user_count", default: 0
    t.string "introduction_title"
    t.string "introduction_content"
    t.integer "money_hour"
    t.integer "money_option"
    t.string "profile_license"
    t.integer "profile_receiving_time_top"
    t.integer "profile_receiving_time_down"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_babysitters_on_user_id"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "visitor_id", null: false
    t.bigint "visited_id", null: false
    t.bigint "order_id"
    t.string "action", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "checked", default: false, null: false
    t.index ["order_id"], name: "index_notifications_on_order_id"
    t.index ["visited_id"], name: "index_notifications_on_visited_id"
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "babysitter_id"
    t.bigint "parent_id"
    t.integer "status", null: false
    t.integer "year", null: false
    t.integer "month", null: false
    t.integer "date", null: false
    t.integer "hour_top", null: false
    t.integer "hour_down", null: false
    t.string "memo"
    t.integer "money_hour", null: false
    t.integer "money_option", null: false
    t.index ["babysitter_id"], name: "index_orders_on_babysitter_id"
    t.index ["parent_id"], name: "index_orders_on_parent_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "parents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "order_memo"
    t.string "order_city"
    t.integer "order_money_hour"
    t.integer "order_money_option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "order_prefecture"
    t.index ["user_id"], name: "index_parents_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "nickname", null: false
    t.string "postcode", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "block", null: false
    t.string "building", null: false
    t.string "email", default: "", null: false
    t.string "phone_number", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "baby_infomations", "parents"
  add_foreign_key "babysitter_images", "babysitters"
  add_foreign_key "babysitters", "users"
  add_foreign_key "notifications", "orders"
  add_foreign_key "notifications", "users", column: "visited_id"
  add_foreign_key "notifications", "users", column: "visitor_id"
  add_foreign_key "orders", "babysitters"
  add_foreign_key "orders", "parents"
  add_foreign_key "orders", "users"
  add_foreign_key "parents", "users"
end
