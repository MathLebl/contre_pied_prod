# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_10_122248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "actus", force: :cascade do |t|
    t.text "description"
    t.string "illustration"
    t.bigint "artist_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "video"
    t.string "title"
    t.date "published_at"
    t.index ["artist_id"], name: "index_actus_on_artist_id"
    t.index ["user_id"], name: "index_actus_on_user_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "style"
    t.string "image"
    t.string "video"
    t.string "deezer"
    t.string "spotify"
    t.string "youtube"
    t.string "insta"
    t.string "twitter"
    t.string "slug"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category", null: false
    t.boolean "active", default: true
    t.string "banner"
    t.string "dice1"
    t.string "dice2"
    t.string "dice3"
    t.string "dice4"
    t.string "facebook"
    t.string "soundcloud"
    t.string "distribution", array: true
    t.string "credits", array: true
    t.string "presse", array: true
    t.string "partenaires", array: true
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.time "time_table"
    t.string "location"
    t.bigint "artist_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ticket"
    t.string "city"
    t.integer "category"
    t.index ["artist_id"], name: "index_events_on_artist_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "actus", "artists"
  add_foreign_key "actus", "users"
  add_foreign_key "artists", "users"
  add_foreign_key "events", "artists"
  add_foreign_key "events", "users"
end
