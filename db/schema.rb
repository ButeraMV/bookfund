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

ActiveRecord::Schema.define(version: 20171108171322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ebook_categories", force: :cascade do |t|
    t.bigint "ebook_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_ebook_categories_on_category_id"
    t.index ["ebook_id"], name: "index_ebook_categories_on_ebook_id"
  end

  create_table "ebooks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.boolean "published", default: false
    t.bigint "author_id"
    t.money "funding", scale: 2
    t.index ["author_id"], name: "index_ebooks_on_author_id"
  end

  create_table "order_ebooks", force: :cascade do |t|
    t.bigint "ebook_id"
    t.bigint "order_id"
    t.integer "quantity"
    t.decimal "line_item_total"
    t.index ["ebook_id"], name: "index_order_ebooks_on_ebook_id"
    t.index ["order_id"], name: "index_order_ebooks_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "total_price"
    t.integer "status", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "user_ebooks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "ebook_id"
    t.index ["ebook_id"], name: "index_user_ebooks_on_ebook_id"
    t.index ["user_id"], name: "index_user_ebooks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "street_address"
    t.string "city"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.string "secret"
  end

  add_foreign_key "ebook_categories", "categories"
  add_foreign_key "ebook_categories", "ebooks"
  add_foreign_key "order_ebooks", "ebooks"
  add_foreign_key "order_ebooks", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "user_ebooks", "ebooks"
  add_foreign_key "user_ebooks", "users"
end
