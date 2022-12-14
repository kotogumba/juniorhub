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

ActiveRecord::Schema[7.0].define(version: 2022_12_13_142753) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blog_categories", force: :cascade do |t|
    t.bigint "blog_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_blog_categories_on_blog_id"
    t.index ["category_id"], name: "index_blog_categories_on_category_id"
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_blog_posts_on_blog_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "blogs_tags", force: :cascade do |t|
    t.bigint "blog_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_blogs_tags_on_blog_id"
    t.index ["tag_id"], name: "index_blogs_tags_on_tag_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "blog_post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "self_id"
    t.bigint "parent_id"
    t.index ["blog_post_id"], name: "index_comments_on_blog_post_id"
    t.index ["parent_id"], name: "index_comments_on_parent_id"
    t.index ["self_id"], name: "index_comments_on_self_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.string "favoritor_type", null: false
    t.bigint "favoritor_id", null: false
    t.string "scope", default: "favorite", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocked"], name: "index_favorites_on_blocked"
    t.index ["favoritable_id", "favoritable_type"], name: "fk_favoritables"
    t.index ["favoritable_type", "favoritable_id", "favoritor_type", "favoritor_id", "scope"], name: "uniq_favorites__and_favoritables", unique: true
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable"
    t.index ["favoritor_id", "favoritor_type"], name: "fk_favorites"
    t.index ["favoritor_type", "favoritor_id"], name: "index_favorites_on_favoritor"
    t.index ["scope"], name: "index_favorites_on_scope"
  end

  create_table "job_responses", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "user_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["job_id"], name: "index_job_responses_on_job_id"
    t.index ["user_id"], name: "index_job_responses_on_user_id"
  end

  create_table "job_tags", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_tags_on_job_id"
    t.index ["tag_id"], name: "index_job_tags_on_tag_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "location"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "summary"
    t.integer "salary"
    t.string "company_name"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "private_chatroom_id"
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["private_chatroom_id"], name: "index_messages_on_private_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "private_chatrooms", force: :cascade do |t|
    t.bigint "user_sender_id"
    t.bigint "user_reciever_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_reciever_id"], name: "index_private_chatrooms_on_user_reciever_id"
    t.index ["user_sender_id"], name: "index_private_chatrooms_on_user_sender_id"
  end

  create_table "private_messages", force: :cascade do |t|
    t.string "content"
    t.bigint "private_chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "new", default: true
    t.index ["private_chatroom_id"], name: "index_private_messages_on_private_chatroom_id"
    t.index ["user_id"], name: "index_private_messages_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "country"
    t.string "linkedin_url"
    t.string "github_url"
    t.string "personal_website_url"
    t.string "resume_url"
    t.string "other_url"
    t.text "bio"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "education"
    t.string "experience"
    t.string "skills"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "nickname"
    t.boolean "company", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "blog_post_id"
    t.integer "value", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_post_id"], name: "index_votes_on_blog_post_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blog_categories", "blogs"
  add_foreign_key "blog_categories", "categories"
  add_foreign_key "blog_posts", "blogs"
  add_foreign_key "blogs", "users"
  add_foreign_key "blogs_tags", "blogs"
  add_foreign_key "blogs_tags", "tags"
  add_foreign_key "comments", "blog_posts"
  add_foreign_key "comments", "comments", column: "parent_id"
  add_foreign_key "comments", "comments", column: "self_id"
  add_foreign_key "comments", "users"
  add_foreign_key "job_responses", "jobs"
  add_foreign_key "job_responses", "users"
  add_foreign_key "job_tags", "jobs"
  add_foreign_key "job_tags", "tags"
  add_foreign_key "jobs", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "private_chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "private_chatrooms", "users", column: "user_reciever_id"
  add_foreign_key "private_chatrooms", "users", column: "user_sender_id"
  add_foreign_key "private_messages", "private_chatrooms"
  add_foreign_key "private_messages", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "votes", "blog_posts"
  add_foreign_key "votes", "users"
end
