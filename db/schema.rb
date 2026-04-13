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

ActiveRecord::Schema[8.0].define(version: 2026_04_13_130848) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "athlete_details", force: :cascade do |t|
    t.string "fpi_card_id"
    t.integer "wins"
    t.integer "draws"
    t.integer "losses"
    t.decimal "weight"
    t.string "category"
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_athlete_details_on_profile_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.time "start_time"
    t.time "end_time"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.bigint "profile_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["profile_id"], name: "index_enrollments_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "profile_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "athlete_details", "profiles"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "profiles"
  add_foreign_key "profiles", "users"
end
