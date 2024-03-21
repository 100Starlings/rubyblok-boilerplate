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

ActiveRecord::Schema[7.1].define(version: 2024_03_19_003053) do
  create_schema "heroku_ext"

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "user_email"
    t.string "message"
    t.datetime "created_at"
    t.datetime "sent_at"
  end

  create_table "page_objects", force: :cascade do |t|
    t.string "storyblok_story_id"
    t.string "storyblok_story_slug"
    t.string "storyblok_story_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["storyblok_story_slug"], name: "index_page_objects_on_storyblok_story_slug", unique: true
  end

  create_table "pages", force: :cascade do |t|
    t.string "storyblok_story_id"
    t.string "storyblok_story_slug"
    t.string "storyblok_story_content"
    t.datetime "created_at", default: "2024-03-12 18:26:53", null: false
    t.datetime "updated_at", default: "2024-03-12 18:26:53", null: false
    t.index ["storyblok_story_slug"], name: "index_pages_on_storyblok_story_slug", unique: true
  end

end
