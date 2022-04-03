# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_03_180812) do

  create_table "app_users", force: :cascade do |t|
    t.integer "app_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "apps", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contact_visitor_joins", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "visitor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.integer "spent"
    t.integer "age"
    t.string "email"
    t.string "gender"
    t.text "first_seen"
    t.text "last_visit"
    t.string "region"
    t.string "city"
    t.string "referring_domain"
    t.string "country_code"
    t.integer "app_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer "visitor_id"
    t.integer "contact_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_identities_on_contact_id"
    t.index ["visitor_id"], name: "index_identities_on_visitor_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "user_id"
    t.string "owner"
    t.integer "app_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.text "password_digest"
    t.text "email"
    t.string "uid", limit: 500
    t.string "provider"
    t.integer "app_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "visitors", force: :cascade do |t|
    t.string "name"
    t.text "first_seen"
    t.text "last_visit"
    t.string "region"
    t.string "city"
    t.string "referring_domain"
    t.string "country_code"
    t.integer "app_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
