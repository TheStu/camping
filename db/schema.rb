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

ActiveRecord::Schema.define(version: 20160824045613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dotds", force: :cascade do |t|
    t.string   "name"
    t.string   "retail_price"
    t.string   "sale_price"
    t.string   "thumb_image"
    t.text     "buy_url"
    t.string   "percent_off"
    t.string   "merchant_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "gears", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.integer  "weight"
    t.string   "shape"
    t.string   "quilt"
    t.integer  "min_temp"
    t.string   "hood"
    t.string   "insulation"
    t.string   "season"
    t.string   "gear_type"
    t.integer  "capacity"
    t.string   "hip_strap"
    t.string   "frame"
    t.string   "access"
    t.string   "length"
    t.integer  "thickness"
    t.integer  "r_value"
    t.string   "waterproof"
    t.string   "bug_proof"
    t.integer  "life_time"
    t.string   "fixed_length"
    t.string   "staff"
    t.string   "poncho"
    t.string   "gender"
    t.string   "material"
    t.string   "upper_material"
    t.string   "deck_material"
    t.string   "frame_material"
    t.string   "heel_lift"
    t.integer  "max_load"
    t.string   "canopy"
    t.string   "rainfly"
    t.string   "add_warmth"
    t.string   "non_stick"
    t.integer  "blade_length"
    t.string   "multi_tool"
    t.string   "declination"
    t.string   "sighting_mirror"
    t.string   "global_needle"
    t.string   "red_light"
    t.integer  "max_output"
    t.integer  "max_distance"
    t.integer  "max_battery"
    t.string   "rechargeable"
    t.boolean  "is_api_searchable"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "large_image_url"
    t.datetime "last_picture_search"
  end

  add_index "gears", ["category_id"], name: "index_gears_on_category_id", using: :btree

  create_table "merchant_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "merchant_id"
    t.integer  "matching_product_group_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "pages", force: :cascade do |t|
    t.text     "content"
    t.string   "title"
    t.integer  "thumbs_up"
    t.integer  "thumbs_down"
    t.string   "large_image_url"
    t.string   "thumb_image_url"
    t.string   "meta_title"
    t.string   "meta_desc"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "post_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "post_categories", ["slug"], name: "index_post_categories_on_slug", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.string   "title"
    t.integer  "thumbs_up"
    t.integer  "thumbs_down"
    t.string   "large_image_url"
    t.string   "thumb_image_url"
    t.string   "meta_title"
    t.string   "meta_desc"
    t.string   "post_category_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "title_param"
    t.string   "slug"
    t.datetime "published_at"
    t.integer  "user_id"
    t.integer  "view_count",       default: 0
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
