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

ActiveRecord::Schema.define(version: 20151020011533) do

  create_table "corpus_entries", force: true do |t|
    t.string   "entry_number"
    t.string   "genre"
    t.string   "deliverable"
    t.string   "classification"
    t.string   "deadline"
    t.string   "format"
    t.string   "grade"
    t.string   "instructor"
    t.string   "student_level"
    t.string   "student_major"
    t.string   "student_gender"
    t.string   "student_age"
    t.string   "student_language"
    t.string   "student_ethnicity"
    t.string   "course_number"
    t.string   "course_section"
    t.string   "course_day"
    t.string   "course_time"
    t.integer  "course_year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
  end

  add_index "corpus_entries", ["member_id"], name: "index_corpus_entries_on_member_id"

  create_table "members", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

end
