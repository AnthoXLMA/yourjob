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

ActiveRecord::Schema.define(version: 2020_08_26_085715) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "applies", force: :cascade do |t|
    t.string "status", default: "pending"
    t.bigint "user_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_applies_on_offer_id"
    t.index ["user_id"], name: "index_applies_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.string "activity"
    t.string "location"
    t.string "contract"
    t.string "interpersonal_skills"
    t.string "rigor"
    t.string "independence"
    t.string "communication"
    t.string "teamwork"
    t.string "creativity"
    t.string "initiative"
    t.string "stress_management"
    t.string "perseverance"
    t.string "decision_making"
    t.string "curiosity"
    t.string "adaptability"
    t.string "enthusiam"
    t.string "flexibility"
    t.string "empathy"
    t.date "starts_on"
    t.text "description"
    t.bigint "recruiter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recruiter_id"], name: "index_offers_on_recruiter_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "company"
    t.index ["email"], name: "index_recruiters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_recruiters_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone_number"
    t.string "location"
    t.string "activity"
    t.string "interpersonal_skills"
    t.string "rigor"
    t.string "independence"
    t.string "communication"
    t.string "teamwork"
    t.string "creativity"
    t.string "initiative"
    t.string "stress_management"
    t.string "perseverance"
    t.string "decision_making"
    t.string "curiosity"
    t.string "adaptability"
    t.string "enthusiam"
    t.string "flexibility"
    t.string "empathy"
    t.string "contract"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "applies", "offers"
  add_foreign_key "applies", "users"
  add_foreign_key "offers", "recruiters"
end