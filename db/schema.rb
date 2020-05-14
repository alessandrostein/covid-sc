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

ActiveRecord::Schema.define(version: 2020_05_13_181509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hospital_beds", force: :cascade do |t|
    t.bigint "hospital_id", null: false
    t.integer "bed_type", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.integer "total_covid", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hospital_id"], name: "index_hospital_beds_on_hospital_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "acronym", default: "", null: false
    t.string "name", default: "", null: false
    t.string "city", default: "", null: false
    t.string "phone_number", limit: 15, default: "", null: false
    t.string "email", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "occupations", force: :cascade do |t|
    t.bigint "report_id", null: false
    t.integer "bed_type", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.integer "total_covid", default: 0, null: false
    t.integer "occupation", default: 0, null: false
    t.integer "occupation_covid", default: 0, null: false
    t.integer "total_waiting_uti", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["report_id"], name: "index_occupations_on_report_id"
  end

  create_table "patient_beds", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.integer "bed_type", default: 0, null: false
    t.datetime "admission_date"
    t.boolean "waiting_uti", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_patient_beds_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.bigint "hospital_id", null: false
    t.string "full_name", default: "", null: false
    t.datetime "birthday"
    t.integer "airways", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "hospitalization_date"
    t.datetime "departure_date"
    t.string "cns", default: "", null: false
    t.string "sisreg", default: "", null: false
    t.integer "departure_reason", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hospital_id"], name: "index_patients_on_hospital_id"
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "hospital_id", null: false
    t.string "informant_name", default: "", null: false
    t.string "informant_function", limit: 15, default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["hospital_id"], name: "index_reports_on_hospital_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "hospital_id"
    t.integer "role", default: 1, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["hospital_id"], name: "index_users_on_hospital_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "hospital_beds", "hospitals"
  add_foreign_key "occupations", "reports"
  add_foreign_key "patient_beds", "patients"
  add_foreign_key "patients", "hospitals"
  add_foreign_key "reports", "hospitals"
  add_foreign_key "reports", "users"
  add_foreign_key "users", "hospitals"
end
