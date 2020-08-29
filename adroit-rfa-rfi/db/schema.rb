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

ActiveRecord::Schema.define(version: 2020_07_27_035458) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "email_lists", force: :cascade do |t|
    t.string "email"
    t.integer "rfa_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rfa_id"], name: "index_email_lists_on_rfa_id"
    t.index ["user_id"], name: "index_email_lists_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.string "users"
    t.string "completion_status"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rfas", force: :cascade do |t|
    t.string "ref"
    t.string "project"
    t.string "request_type"
    t.boolean "completed"
    t.integer "number"
    t.string "rev"
    t.text "subject"
    t.datetime "issued_date"
    t.datetime "required_reply_date"
    t.string "to"
    t.datetime "reply_date"
    t.datetime "approval_date"
    t.string "replied_by"
    t.string "status"
    t.integer "days_lagging"
    t.integer "count"
    t.text "transmittal_advice"
    t.text "remarks"
    t.string "trade"
    t.string "emailed_to"
    t.integer "gridline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ref_key"
    t.string "sheet_name"
    t.boolean "is_latest"
    t.integer "project_id"
    t.index ["project_id"], name: "index_rfas_on_project_id"
  end

  create_table "to_users", force: :cascade do |t|
    t.integer "rfa_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rfa_id"], name: "index_to_users_on_rfa_id"
    t.index ["user_id"], name: "index_to_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "trade"
    t.string "vendor"
    t.string "ref_submitted_RFA"
    t.string "ref_submitted_RFI"
    t.string "ref_assigned_RFA"
    t.string "ref_assigned_RFI"
    t.string "ref_handled_RFA"
    t.string "ref_handled_RFI"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

end
