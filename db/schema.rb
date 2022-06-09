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

ActiveRecord::Schema.define(version: 2022_06_08_172400) do

  create_table "course_registration_detail_values", force: :cascade do |t|
    t.integer "course_registration_detail_id"
    t.string "value", limit: 255
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_registration_detail_id"], name: "crdv_on_crdid"
  end

  create_table "course_registration_details", force: :cascade do |t|
    t.integer "course_id"
    t.string "name", limit: 255
    t.string "question", limit: 255
    t.string "template", limit: 255
    t.boolean "required", default: false
    t.string "validation_regex_required", limit: 255
    t.string "validation_value_max", limit: 255
    t.string "validation_value_min", limit: 255
    t.string "format", limit: 255
    t.boolean "is_sensitive", default: false
    t.integer "order", limit: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_registration_details_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "state_cd", limit: 2, default: "", null: false
    t.string "course_name", limit: 100, default: "", null: false
    t.string "course_domain", limit: 255, null: false
    t.boolean "active", default: false, null: false
    t.boolean "closed", default: false, null: false
    t.string "country_code", limit: 255
    t.boolean "marketing_page", default: false
    t.string "actor", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
