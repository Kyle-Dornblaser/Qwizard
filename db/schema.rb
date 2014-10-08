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

ActiveRecord::Schema.define(version: 20141008200739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_choices", force: true do |t|
    t.string   "choice"
    t.boolean  "correct_choice"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_choices", ["question_id"], name: "index_admin_choices_on_question_id", using: :btree

  create_table "admin_difficulties", force: true do |t|
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_question_instances", force: true do |t|
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_question_instances", ["question_id"], name: "index_admin_question_instances_on_question_id", using: :btree

  create_table "admin_questions", force: true do |t|
    t.integer  "question_type"
    t.string   "question"
    t.integer  "attempts"
    t.integer  "difficulty_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_questions", ["difficulty_id"], name: "index_admin_questions_on_difficulty_id", using: :btree

  create_table "admin_user_responses", force: true do |t|
    t.string   "response"
    t.integer  "award"
    t.integer  "question_instance_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_user_responses", ["question_instance_id"], name: "index_admin_user_responses_on_question_instance_id", using: :btree
  add_index "admin_user_responses", ["user_id"], name: "index_admin_user_responses_on_user_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "avatar"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "widgets", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
