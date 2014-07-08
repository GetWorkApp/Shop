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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140707193412) do

  create_table "cart_items", force: true do |t|
    t.integer  "cart_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "variant_id"
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id"

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string  "name"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.text     "description"
    t.string   "permalink"
    t.boolean  "featured"
    t.boolean  "active",           default: false
    t.integer  "brand_id"
    t.string   "meta_keywords"
    t.string   "meta_description"
  end

  create_table "properties", force: true do |t|
    t.integer  "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variant_properties", force: true do |t|
    t.integer "variant_id",                  null: false
    t.integer "property_id",                 null: false
    t.string  "description",                 null: false
    t.boolean "primary",     default: false
  end

  add_index "variant_properties", ["property_id"], name: "index_variant_properties_on_property_id"
  add_index "variant_properties", ["variant_id"], name: "index_variant_properties_on_variant_id"

  create_table "variants", force: true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.decimal  "price",         precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "cost",          precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "count_on_hand",                         default: 0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
