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

ActiveRecord::Schema.define(version: 20170814220610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_listings", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_listings_on_category_id"
    t.index ["listing_id"], name: "index_category_listings_on_listing_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.string "author"
    t.string "author_email"
    t.string "author_url"
    t.string "author_IP"
    t.text "content"
    t.string "approved", default: "pending"
    t.string "agent"
    t.string "typee"
    t.integer "comment_parent"
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approved"], name: "index_comments_on_approved"
    t.index ["comment_parent"], name: "index_comments_on_comment_parent"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "custom_fields", id: :serial, force: :cascade do |t|
    t.string "object_class"
    t.string "name"
    t.string "slug"
    t.integer "objectid"
    t.integer "parent_id"
    t.integer "field_order"
    t.integer "count", default: 0
    t.boolean "is_repeat", default: false
    t.text "description"
    t.string "status"
    t.index ["object_class"], name: "index_custom_fields_on_object_class"
    t.index ["objectid"], name: "index_custom_fields_on_objectid"
    t.index ["parent_id"], name: "index_custom_fields_on_parent_id"
    t.index ["slug"], name: "index_custom_fields_on_slug"
  end

  create_table "custom_fields_relationships", id: :serial, force: :cascade do |t|
    t.integer "objectid"
    t.integer "custom_field_id"
    t.integer "term_order"
    t.string "object_class"
    t.text "value"
    t.string "custom_field_slug"
    t.integer "group_number", default: 0
    t.index ["custom_field_id"], name: "index_custom_fields_relationships_on_custom_field_id"
    t.index ["custom_field_slug"], name: "index_custom_fields_relationships_on_custom_field_slug"
    t.index ["object_class"], name: "index_custom_fields_relationships_on_object_class"
    t.index ["objectid"], name: "index_custom_fields_relationships_on_objectid"
  end

  create_table "kms_assets", force: :cascade do |t|
    t.string "file"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kms_pages", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "content", default: ""
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "template_id"
    t.string "ancestry"
    t.string "fullpath"
    t.boolean "templatable", default: false
    t.string "templatable_type"
    t.boolean "hidden", default: false
    t.integer "position", default: 0, null: false
    t.index ["ancestry"], name: "index_kms_pages_on_ancestry"
  end

  create_table "kms_settings", force: :cascade do |t|
    t.json "values", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kms_snippets", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kms_templates", force: :cascade do |t|
    t.string "name"
    t.text "content", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "city"
    t.string "street"
    t.string "landmark"
    t.string "phonenumber"
    t.float "longtitude"
    t.float "latitude"
    t.bigint "user_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_lessons_on_listing_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "status"
    t.bigint "owner_id"
    t.bigint "user_id"
    t.string "city"
    t.string "street"
    t.string "landmark"
    t.string "phonenumber"
    t.float "longtitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_listings_on_owner_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "metas", id: :serial, force: :cascade do |t|
    t.string "key"
    t.text "value"
    t.integer "objectid"
    t.string "object_class"
    t.index ["key"], name: "index_metas_on_key"
    t.index ["object_class"], name: "index_metas_on_object_class"
    t.index ["objectid"], name: "index_metas_on_objectid"
  end

  create_table "plugins_attacks", force: :cascade do |t|
    t.string "path"
    t.string "browser_key"
    t.bigint "site_id"
    t.datetime "created_at"
    t.index ["browser_key"], name: "index_plugins_attacks_on_browser_key"
    t.index ["path"], name: "index_plugins_attacks_on_path"
    t.index ["site_id"], name: "index_plugins_attacks_on_site_id"
  end

  create_table "plugins_contact_forms", id: :serial, force: :cascade do |t|
    t.integer "site_id"
    t.integer "count"
    t.integer "parent_id"
    t.string "name"
    t.string "slug"
    t.text "description"
    t.text "value"
    t.text "settings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "content"
    t.text "content_filtered"
    t.string "status", default: "published"
    t.datetime "published_at"
    t.integer "post_parent"
    t.string "visibility", default: "public"
    t.text "visibility_value"
    t.string "post_class", default: "Post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "post_order", default: 0
    t.integer "taxonomy_id"
    t.boolean "is_feature", default: false
    t.index ["post_class"], name: "index_posts_on_post_class"
    t.index ["post_parent"], name: "index_posts_on_post_parent"
    t.index ["slug"], name: "index_posts_on_slug"
    t.index ["status"], name: "index_posts_on_status"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "responds", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_responds_on_review_id"
    t.index ["user_id"], name: "index_responds_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.bigint "listing_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_reviews_on_listing_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "service_listings", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_service_listings_on_listing_id"
    t.index ["service_id"], name: "index_service_listings_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_listings", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_tag_listings_on_listing_id"
    t.index ["tag_id"], name: "index_tag_listings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "term_relationships", id: :serial, force: :cascade do |t|
    t.integer "objectid"
    t.integer "term_order"
    t.integer "term_taxonomy_id"
    t.index ["objectid"], name: "index_term_relationships_on_objectid"
    t.index ["term_order"], name: "index_term_relationships_on_term_order"
    t.index ["term_taxonomy_id"], name: "index_term_relationships_on_term_taxonomy_id"
  end

  create_table "term_taxonomy", id: :serial, force: :cascade do |t|
    t.string "taxonomy"
    t.text "description"
    t.integer "parent_id"
    t.integer "count"
    t.string "name"
    t.string "slug"
    t.integer "term_group"
    t.integer "term_order"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["parent_id"], name: "index_term_taxonomy_on_parent_id"
    t.index ["slug"], name: "index_term_taxonomy_on_slug"
    t.index ["taxonomy"], name: "index_term_taxonomy_on_taxonomy"
    t.index ["term_order"], name: "index_term_taxonomy_on_term_order"
    t.index ["user_id"], name: "index_term_taxonomy_on_user_id"
  end

  create_table "timings", force: :cascade do |t|
    t.string "day"
    t.time "start_time"
    t.time "end_time"
    t.integer "status"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_timings_on_listing_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "role"
    t.string "username"
    t.integer "parent_id"
    t.integer "site_id", default: -1
    t.string "auth_token"
    t.string "confirm_email_token"
    t.datetime "confirm_email_sent_at"
    t.boolean "is_valid_email", default: true
    t.string "first_name"
    t.string "last_name"
    t.datetime "last_login_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "category_listings", "categories"
  add_foreign_key "category_listings", "listings"
  add_foreign_key "lessons", "listings"
  add_foreign_key "lessons", "users"
  add_foreign_key "responds", "reviews"
  add_foreign_key "responds", "users"
  add_foreign_key "reviews", "listings"
  add_foreign_key "reviews", "users"
  add_foreign_key "service_listings", "listings"
  add_foreign_key "service_listings", "services"
  add_foreign_key "tag_listings", "listings"
  add_foreign_key "tag_listings", "tags"
  add_foreign_key "timings", "listings"
end
