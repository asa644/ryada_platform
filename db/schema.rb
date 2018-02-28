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

ActiveRecord::Schema.define(version: 20180227211952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phonenumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_attendees_on_slug", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "lesson_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.index ["lesson_id"], name: "index_bookings_on_lesson_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_lessons", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_lessons_on_category_id"
    t.index ["lesson_id"], name: "index_category_lessons_on_lesson_id"
  end

  create_table "category_listings", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_listings_on_category_id"
    t.index ["listing_id"], name: "index_category_listings_on_listing_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_feedbacks_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "lesson_exceptions", force: :cascade do |t|
    t.bigint "lesson_id"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_exceptions_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "city"
    t.string "street"
    t.string "landmark"
    t.string "phonenumber"
    t.bigint "user_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "photos"
    t.string "country"
    t.string "zip_code"
    t.text "recurring"
    t.time "start_time"
    t.float "price"
    t.index ["listing_id"], name: "index_lessons_on_listing_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "listing_photos", force: :cascade do |t|
    t.string "photo"
    t.bigint "listing_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_listing_photos_on_listing_id"
    t.index ["user_id"], name: "index_listing_photos_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "owner_id"
    t.bigint "user_id"
    t.string "city"
    t.string "street"
    t.string "landmark"
    t.string "phonenumber"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ownerphone"
    t.json "photos"
    t.string "address"
    t.string "country"
    t.string "zip_code"
    t.integer "status", default: 0
    t.string "slug"
    t.index ["owner_id"], name: "index_listings_on_owner_id"
    t.index ["slug"], name: "index_listings_on_slug", unique: true
    t.index ["user_id"], name: "index_listings_on_user_id"
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

  create_table "schedules", force: :cascade do |t|
    t.string "schedulable_type"
    t.bigint "schedulable_id"
    t.date "date"
    t.time "time"
    t.string "rule"
    t.string "interval"
    t.text "day"
    t.text "day_of_week"
    t.datetime "until"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedulable_type", "schedulable_id"], name: "index_schedules_on_schedulable_type_and_schedulable_id"
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

  create_table "spina_accounts", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "postal_code"
    t.string "city"
    t.string "phone"
    t.string "email"
    t.text "preferences"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kvk_identifier"
    t.string "vat_identifier"
    t.boolean "robots_allowed", default: false
  end

  create_table "spina_attachment_collections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spina_attachment_collections_attachments", force: :cascade do |t|
    t.integer "attachment_collection_id"
    t.integer "attachment_id"
  end

  create_table "spina_attachments", force: :cascade do |t|
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spina_layout_parts", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.integer "layout_partable_id"
    t.string "layout_partable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "account_id"
  end

  create_table "spina_lines", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spina_page_parts", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "page_id"
    t.integer "page_partable_id"
    t.string "page_partable_type"
  end

  create_table "spina_pages", force: :cascade do |t|
    t.string "title"
    t.string "menu_title"
    t.string "description"
    t.boolean "show_in_menu", default: true
    t.string "slug"
    t.boolean "deletable", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "seo_title"
    t.boolean "skip_to_first_child", default: false
    t.string "view_template"
    t.string "layout_template"
    t.boolean "draft", default: false
    t.string "link_url"
    t.string "ancestry"
    t.integer "position"
    t.string "materialized_path"
    t.boolean "active", default: true
  end

  create_table "spina_photo_collections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spina_photo_collections_photos", force: :cascade do |t|
    t.integer "photo_collection_id"
    t.integer "photo_id"
    t.integer "position"
  end

  create_table "spina_photos", force: :cascade do |t|
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spina_rewrite_rules", force: :cascade do |t|
    t.string "old_path"
    t.string "new_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spina_structure_items", force: :cascade do |t|
    t.integer "structure_id"
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["structure_id"], name: "index_spina_structure_items_on_structure_id"
  end

  create_table "spina_structure_parts", force: :cascade do |t|
    t.integer "structure_item_id"
    t.integer "structure_partable_id"
    t.string "structure_partable_type"
    t.string "name"
    t.string "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["structure_item_id"], name: "index_spina_structure_parts_on_structure_item_id"
    t.index ["structure_partable_id"], name: "index_spina_structure_parts_on_structure_partable_id"
  end

  create_table "spina_structures", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spina_texts", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spina_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_logged_in"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_subscribers_on_slug", unique: true
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
    t.string "name"
    t.string "phone"
    t.float "weight"
    t.float "height"
    t.date "birthdate"
    t.string "photo"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "lessons"
  add_foreign_key "bookings", "users"
  add_foreign_key "category_lessons", "lessons"
  add_foreign_key "category_listings", "categories"
  add_foreign_key "category_listings", "listings"
  add_foreign_key "lesson_exceptions", "lessons"
  add_foreign_key "lessons", "listings"
  add_foreign_key "lessons", "users"
  add_foreign_key "listing_photos", "listings"
  add_foreign_key "listing_photos", "users"
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
