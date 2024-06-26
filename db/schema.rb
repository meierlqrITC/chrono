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

ActiveRecord::Schema[7.1].define(version: 2024_06_25_211453) do
  create_table "anwesenheitslistes", force: :cascade do |t|
    t.integer "veranstaltung_id", null: false
    t.datetime "datum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["veranstaltung_id"], name: "index_anwesenheitslistes_on_veranstaltung_id"
  end

  create_table "beobachters", force: :cascade do |t|
    t.string "name"
    t.integer "termin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["termin_id"], name: "index_beobachters_on_termin_id"
  end

  create_table "fehlzeits", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "veranstaltung_id", null: false
    t.datetime "datum"
    t.text "begründung"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_fehlzeits_on_student_id"
    t.index ["veranstaltung_id"], name: "index_fehlzeits_on_veranstaltung_id"
  end

  create_table "moduls", force: :cascade do |t|
    t.string "name"
    t.text "beschreibung"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "rolle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "termins", force: :cascade do |t|
    t.string "bezeichnung"
    t.datetime "beginn"
    t.datetime "ende"
    t.text "beschreibung"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "veranstaltung_id", null: false
    t.index ["veranstaltung_id"], name: "index_termins_on_veranstaltung_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "veranstaltungs", force: :cascade do |t|
    t.string "name"
    t.datetime "datum"
    t.text "beschreibung"
    t.integer "modul_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modul_id"], name: "index_veranstaltungs_on_modul_id"
  end

  add_foreign_key "anwesenheitslistes", "veranstaltungs"
  add_foreign_key "beobachters", "termins"
  add_foreign_key "fehlzeits", "students"
  add_foreign_key "fehlzeits", "veranstaltungs"
  add_foreign_key "termins", "veranstaltungs"
  add_foreign_key "users", "roles"
  add_foreign_key "veranstaltungs", "moduls"
end
