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

ActiveRecord::Schema.define(version: 20150907231729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classifications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts_organisations", id: false, force: :cascade do |t|
    t.integer "district_id"
    t.integer "organisation_id"
  end

  create_table "individuals", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "phone"
    t.text     "additional_skills"
    t.string   "town"
    t.string   "postcode"
  end

  add_index "individuals", ["user_id"], name: "index_individuals_on_user_id", using: :btree

  create_table "individuals_interests", id: false, force: :cascade do |t|
    t.integer "individual_id"
    t.integer "interest_id"
  end

  create_table "individuals_skills", id: false, force: :cascade do |t|
    t.integer "individual_id"
    t.integer "skill_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests_organisations", id: false, force: :cascade do |t|
    t.integer "interest_id"
    t.integer "organisation_id"
  end

  create_table "opportunities", force: :cascade do |t|
    t.string   "name"
    t.integer  "organisation_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.text     "tasks"
    t.string   "commitment"
    t.date     "close"
    t.text     "benefits"
    t.boolean  "reimburse_expenses"
    t.text     "additional_information"
    t.boolean  "under_18"
    t.boolean  "expert"
    t.boolean  "group"
    t.string   "town"
    t.string   "postcode"
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "title"
    t.string   "email"
  end

  add_index "opportunities", ["organisation_id"], name: "index_opportunities_on_organisation_id", using: :btree
  add_index "opportunities", ["user_id"], name: "index_opportunities_on_user_id", using: :btree

  create_table "opportunities_skills", id: false, force: :cascade do |t|
    t.integer "opportunity_id"
    t.integer "skill_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "website"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "town"
    t.string   "county"
    t.string   "postcode"
    t.text     "description"
    t.integer  "classification_id"
    t.string   "twitter"
  end

  add_index "organisations", ["classification_id"], name: "index_organisations_on_classification_id", using: :btree

  create_table "posters", force: :cascade do |t|
    t.string   "mobile"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organisation_id"
    t.string   "title"
    t.integer  "user_id"
  end

  add_index "posters", ["organisation_id"], name: "index_posters_on_organisation_id", using: :btree
  add_index "posters", ["user_id"], name: "index_posters_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "individuals", "users"
  add_foreign_key "opportunities", "organisations"
  add_foreign_key "opportunities", "users"
  add_foreign_key "organisations", "classifications"
  add_foreign_key "posters", "organisations"
  add_foreign_key "posters", "users"
end
