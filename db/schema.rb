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

ActiveRecord::Schema.define(version: 20161122114446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absence_status_translations", force: :cascade do |t|
    t.integer  "absence_status_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name",              null: false
    t.index ["absence_status_id"], name: "index_absence_status_translations_on_absence_status_id", using: :btree
    t.index ["locale"], name: "index_absence_status_translations_on_locale", using: :btree
  end

  create_table "absence_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "absence_type_translations", force: :cascade do |t|
    t.integer  "absence_type_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name",            null: false
    t.index ["absence_type_id"], name: "index_absence_type_translations_on_absence_type_id", using: :btree
    t.index ["locale"], name: "index_absence_type_translations_on_locale", using: :btree
  end

  create_table "absence_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "absences", force: :cascade do |t|
    t.integer  "absence_type_id"
    t.datetime "start"
    t.datetime "end"
    t.float    "days"
    t.string   "comments"
    t.integer  "absence_status_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["absence_status_id"], name: "index_absences_on_absence_status_id", using: :btree
    t.index ["absence_type_id"], name: "index_absences_on_absence_type_id", using: :btree
    t.index ["user_id"], name: "index_absences_on_user_id", using: :btree
  end

  create_table "user_role_translations", force: :cascade do |t|
    t.integer  "user_role_id", null: false
    t.string   "locale",       null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name",         null: false
    t.index ["locale"], name: "index_user_role_translations_on_locale", using: :btree
    t.index ["user_role_id"], name: "index_user_role_translations_on_user_role_id", using: :btree
  end

  create_table "user_roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_role_id",           default: 3
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["user_role_id"], name: "index_users_on_user_role_id", using: :btree
  end

  add_foreign_key "absences", "absence_statuses"
  add_foreign_key "absences", "absence_types"
  add_foreign_key "absences", "users"
end
