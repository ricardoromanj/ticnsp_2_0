# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151211054329) do

  create_table "children", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "gender"
    t.string   "birthdate"
    t.string   "image_id"
    t.string   "allergies"
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "children", ["lastname"], name: "index_children_on_lastname"
  add_index "children", ["name"], name: "index_children_on_name"

  create_table "commissions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image_id"
    t.integer  "semester_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string   "email"
    t.string   "email_type"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "emails", ["user_id"], name: "index_emails_on_user_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "date_start"
    t.datetime "date_end"
    t.string   "description"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "location"
    t.string   "audience"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "lectures", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image_id"
    t.integer  "semester_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "marks", id: false, force: :cascade do |t|
    t.integer  "marker_id"
    t.string   "marker_type"
    t.integer  "markable_id"
    t.string   "markable_type"
    t.string   "mark",          limit: 128
    t.datetime "created_at"
  end

  add_index "marks", ["markable_id", "markable_type", "mark"], name: "index_marks_on_markable_id_and_markable_type_and_mark"
  add_index "marks", ["marker_id", "marker_type", "mark"], name: "index_marks_on_marker_id_and_marker_type_and_mark"

  create_table "notices", force: :cascade do |t|
    t.string   "heading"
    t.string   "text"
    t.string   "audience"
    t.string   "notice_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "actor_id"
    t.datetime "read_at"
    t.string   "action"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.string   "phone_type"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "phones", ["user_id"], name: "index_phones_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.datetime "end_date"
    t.boolean  "completed"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.string   "name"
    t.datetime "date_start"
    t.datetime "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shepperdings", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.datetime "end_date"
    t.boolean  "completed"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "usertype",               default: "",   null: false
    t.string   "username",               default: "",   null: false
    t.string   "image_id"
    t.boolean  "use_gravatar",           default: true, null: false
    t.string   "name"
    t.string   "lastname"
    t.string   "birthdate"
    t.string   "gender"
    t.string   "role"
    t.string   "notes"
    t.string   "recents"
    t.string   "favorites"
    t.string   "settings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["lastname"], name: "index_users_on_lastname"
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "visitor_messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "message_text"
    t.boolean  "read"
    t.datetime "read_at"
    t.boolean  "replied"
    t.datetime "replied_at"
    t.integer  "replied_by_user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "workshops", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image_id"
    t.integer  "semester_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
